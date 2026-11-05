# DevSecOps 8: Infrastructure as Code (IaC) & Terraform mit Azure

Themenschwerpunkte sind die Grundlagen von **Infrastructure as Code (IaC)** mit **HashiCorp Terraform** auf Microsoft Azure. Dies umfasst die Installation und Konfiguration der Terraform CLI, die tokenbasierte Authentifizierung des `azurerm`-Providers über einen dedizierten **Microsoft Entra ID Service Principal**, den elementaren Terraform-Arbeitszyklus (`init`, `fmt`, `validate`, `plan`, `apply`), die Verwaltung des **Terraform State** (`show`, `state list`), das Aufspüren und Beheben von **Konfigurationsdrift** (Drift Detection & Reconciliation), die deklarative Erweiterung von Cloud-Ressourcen (Tags, Virtual Networks) sowie das moderne **Resource Importing** bestehender Azure-Ressourcen (mittels deklarativem `import`-Block ab Terraform 1.5+ und automatisierter Konfigurationsgenerierung).

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Alle Basis-Umgebungsvariablen (`REGION`, `RG`, `VNET`, `VM`) gesammelt |
| [`01_export_region.sh`](./01_export_region.sh) | `export REGION="germanywestcentral"` |
| [`02_export_rg.sh`](./02_export_rg.sh) | `export RG="dev-sec-ops-8-lab-rg"` |
| [`03_export_vnet.sh`](./03_export_vnet.sh) | `export VNET="dev-sec-ops-8-lab-vnet"` |
| [`04_export_vm.sh`](./04_export_vm.sh) | `export VM="dev-sec-ops-8-lab-vm"` |
| [`05_install_terraform_gpg.sh`](./05_install_terraform_gpg.sh) | Lädt den offiziellen HashiCorp GPG-Keyring herunter |
| [`06_install_terraform_repo.sh`](./06_install_terraform_repo.sh) | Bindet das offizielle HashiCorp APT-Repository ein |
| [`07_install_terraform_apt.sh`](./07_install_terraform_apt.sh) | Installiert die Terraform CLI via `apt update && apt install` |
| [`08_export_arm_subscription_id.sh`](./08_export_arm_subscription_id.sh) | Ermittelt die Azure Subscription-ID via `az account show` |
| [`09_az_ad_sp_create_for_rbac.sh`](./09_az_ad_sp_create_for_rbac.sh) | Erstellt einen Microsoft Entra Service Principal mit `Contributor`-Rolle |
| [`10_export_arm_credentials.sh`](./10_export_arm_credentials.sh) | Extrahiert und exportiert die `ARM_*`-Anmeldedaten für Terraform |
| [`11_create_project_dir.sh`](./11_create_project_dir.sh) | Erstellt das Terraform-Projektverzeichnis `learn-terraform-azure` |
| [`12_create_main_tf_initial.sh`](./12_create_main_tf_initial.sh) | Schreibt die initiale `main.tf` (`azurerm`-Provider & Resource Group) |
| [`13_terraform_init.sh`](./13_terraform_init.sh) | Initialisiert Terraform und lädt den `azurerm`-Provider |
| [`14_terraform_fmt.sh`](./14_terraform_fmt.sh) | Formatiert HCL-Dateien nach HashiCorp-Standards (`terraform fmt`) |
| [`15_terraform_validate.sh`](./15_terraform_validate.sh) | Validiert die HCL-Syntax und Provider-Vorgaben (`terraform validate`) |
| [`16_terraform_plan.sh`](./16_terraform_plan.sh) | Erstellt und prüft den Ausführungsplan (`terraform plan`) |
| [`17_terraform_apply.sh`](./17_terraform_apply.sh) | Wendet den Plan an und provisioniert die Resource Group (`terraform apply`) |
| [`18_terraform_show.sh`](./18_terraform_show.sh) | Zeigt den aktuellen Zustand des State-Files formatiert an (`terraform show`) |
| [`19_terraform_state_list.sh`](./19_terraform_state_list.sh) | Listet alle verwalteten Ressourcen im State auf (`terraform state list`) |
| [`20_terraform_state.sh`](./20_terraform_state.sh) | Zeigt Befehle für granulare State-Operationen an (`terraform state`) |
| [`21_az_group_delete_drift_demo.sh`](./21_az_group_delete_drift_demo.sh) | Löscht die Resource Group manuell zur Simulation von Konfigurationsdrift |
| [`22_terraform_plan_drift.sh`](./22_terraform_plan_drift.sh) | Erkennt den Drift und plant die Neuerstellung der Ressource |
| [`23_terraform_apply_drift_recreate.sh`](./23_terraform_apply_drift_recreate.sh) | Stellt den gewünschten Soll-Zustand automatisch wieder her |
| [`24_update_main_tf_with_vnet.sh`](./24_update_main_tf_with_vnet.sh) | Erweitert `main.tf` um Tags und ein `azurerm_virtual_network` |
| [`25_terraform_apply_vnet.sh`](./25_terraform_apply_vnet.sh) | Führt Plan & Apply für das Virtual Network durch |
| [`26_az_vm_create_manual.sh`](./26_az_vm_create_manual.sh) | Erstellt manuell eine Azure VM außerhalb von Terraform |
| [`27_export_vm_id.sh`](./27_export_vm_id.sh) | Ermittelt die Azure Resource-ID der manuell erstellten VM |
| [`28_create_import_tf.sh`](./28_create_import_tf.sh) | Definiert den modernen deklarativen `import`-Block in `import.tf` |
| [`29_terraform_plan_generate_config.sh`](./29_terraform_plan_generate_config.sh) | Generiert automatisch HCL-Code via `-generate-config-out` |
| [`30_sed_clean_generated_tf.sh`](./30_sed_clean_generated_tf.sh) | Bereinigt inkompatible Attribute (`platform_fault_domain`) |
| [`31_terraform_apply_imported_vm.sh`](./31_terraform_apply_imported_vm.sh) | Importiert die VM offiziell in den Terraform State |
| [`32_terraform_destroy.sh`](./32_terraform_destroy.sh) | Deprovisioniert alle verwalteten Ressourcen rückstandsfrei |

---

## Workflow & Erläuterungen

### 1. Infrastructure as Code (IaC) & Terraform Architektur

Terraform ist ein deklaratives Open-Source-IaC-Werkzeug. Anstatt Infrastruktur manuell im Azure Portal oder sequentiell über imperative CLI-Skripte anzulegen, wird der gewünschte Zielzustand (**Desired State**) in der HashiCorp Configuration Language (**HCL**) beschrieben. Terraform berechnet die Differenz zwischen dem aktuellen Ist-Zustand (**Current State**) und dem Zielzustand und führt ausschließlich die notwendigen Änderungen aus.

### 2. Authentifizierung über Microsoft Entra ID Service Principal

Für Automatisierungen und CI/CD-Pipelines authentifiziert sich Terraform nicht über interaktive Benutzer-Logins (`az login`), sondern über einen Service Principal. Der Provider `azurerm` wertet standardmäßig folgende Umgebungsvariablen aus:
- `ARM_SUBSCRIPTION_ID`: Ziel-Subscription für alle Operationen
- `ARM_CLIENT_ID`: App-ID des Service Principals
- `ARM_CLIENT_SECRET`: Passwort / Secret des Service Principals
- `ARM_TENANT_ID`: Microsoft Entra ID Tenant-ID

Mit `az ad sp create-for-rbac` wird das Dienstkonto provisioniert und mit der Rolle `Contributor` ausgestattet.

### 3. Der fundamentale Terraform-Lebenszyklus

Der reguläre Entwicklungszyklus in Terraform folgt klaren, standardisierten Phasen:
1. **`terraform init`**: Lädt die benötigten Provider-Plugins (hier `hashicorp/azurerm`) herunter und initialisiert das lokale `.terraform`-Verzeichnis.
2. **`terraform fmt`**: Formatiert Konfigurationsdateien einheitlich nach HashiCorp-Styleguides.
3. **`terraform validate`**: Prüft die HCL-Dateien auf syntaktische Richtigkeit und Übereinstimmung mit dem Provider-Schema ohne API-Aufrufe.
4. **`terraform plan`**: Liest den aktuellen Zustand der Cloud-Ressourcen aus, vergleicht ihn mit dem Code und erstellt einen detaillierten Ausführungsplan (`+ create`, `~ update in-place`, `- destroy`).
5. **`terraform apply`**: Führt den Ausführungsplan gegen die Azure ARM APIs aus und aktualisiert die Zustandsdatei (`terraform.tfstate`).

### 4. State Management & Drift Detection

Das **State-File** (`terraform.tfstate`) ist das Herzstück von Terraform. Es bildet die HCL-Ressourcen auf reale Azure-Ressourcen-IDs ab.
Wird eine Ressource manuell (z. B. versehentlich über das Azure Portal oder `az group delete`) modifiziert oder gelöscht, entsteht sogenannter **Konfigurationsdrift**:
- Bei einem erneuten `terraform plan` stellt Terraform fest, dass die reale Ressource fehlt.
- Durch `terraform apply` wird die Ressource exakt nach der ursprünglichen Definition deklarativ wiederhergestellt (**Reconciliation** / Selbstheilung).

### 5. Deklarative Konfigurationsänderung

Änderungen an der Infrastruktur (wie das Hinzufügen von Tags oder neuen Ressourcen wie `azurerm_virtual_network`) werden direkt in `main.tf` vorgenommen. Terraform erkennt Ressourcenabhängigkeiten (Dependency Graph) automatisch: Das Virtual Network referenziert `azurerm_resource_group.rg.name`, wodurch Terraform sicherstellt, dass die Ressourcengruppe vor dem VNet existiert.

### 6. Modernes Resource Importing (Terraform 1.5+)

Früher erforderte der Import bestehender Ressourcen den imperativen Befehl `terraform import`, bei dem HCL-Code manuell und fehleranfällig nachgeschrieben werden musste.
Ab **Terraform 1.5** geschieht dies deklarativ:
1. Deklaration eines **`import`-Blocks** in HCL unter Angabe der Zieladresse (`to`) und der Azure Resource ID (`id`).
2. Generierung der vollständigen HCL-Konfiguration über `terraform plan -generate-config-out=generated_vm.tf`.
3. Gegebenenfalls syntaktische Bereinigung von Read-Only- oder API-spezifischen Attributen (wie `platform_fault_domain`).
4. Ausführen von `terraform apply`, womit die bestehende Cloud-Ressource ohne Ausfallzeit oder Neuerstellung unter Terraform-Verwaltung gestellt wird.

### 7. Vollständiger Rückbau (`terraform destroy`)

Mit `terraform destroy` analysiert Terraform das State-File und baut alle darin enthaltenen Ressourcen in umgekehrter Abhängigkeitsreihenfolge sauber und rückstandsfrei ab.
