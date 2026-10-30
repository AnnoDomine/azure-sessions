# DevSecOps 4: Secrets Management (Azure Key Vault, RBAC & Managed Identity)

Themenschwerpunkte sind die sichere Verwaltung von Anwendungs- und Infrastrukturgeheimnissen mit **Azure Key Vault**, die moderne feingranulare Autorisierung über **Microsoft Entra ID RBAC (`--enable-rbac-authorization true`)**, die Versionierung von Geheimnissen inklusive Ablaufdaten (**Secret Rotation & Lifecycle**), sowie die Implementierung einer **Zero-Secret-Architektur**: Eine Azure VM erhält eine **System-Assigned Managed Identity**, der gezielt Least-Privilege-Leserechte (`Key Vault Secrets User`) auf den Key Vault zugewiesen werden. Mittels **Azure VM Run-Command** und dem **Azure Instance Metadata Service (IMDS)** greift die VM passwort- und schlüssellos auf geschützte Secrets zu.

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Alle Basis-Umgebungsvariablen (`RG`, `REGION`, `KV_NAME`, `VM`) gesammelt |
| [`01_export_rg.sh`](./01_export_rg.sh) | `export RG="key-vault-lab-rg"` |
| [`02_export_region.sh`](./02_export_region.sh) | `export REGION="germanywestcentral"` |
| [`03_export_kv_name.sh`](./03_export_kv_name.sh) | Generiert einen global eindeutigen Key-Vault-Namen `kv-<random-hex>` |
| [`04_az_group_create.sh`](./04_az_group_create.sh) | Erstellt die Azure Resource Group `key-vault-lab-rg` |
| [`05_az_keyvault_create.sh`](./05_az_keyvault_create.sh) | Erstellt den Azure Key Vault mit aktivierter Entra ID RBAC-Autorisierung |
| [`06_export_user_and_kv_id.sh`](./06_export_user_and_kv_id.sh) | Extrahiert die Entra-ID Benutzer-Object-ID und die Ressourcen-ID des Key Vaults |
| [`07_az_role_assignment_create_secrets_officer.sh`](./07_az_role_assignment_create_secrets_officer.sh) | Weist dem Administrator die Rolle `Key Vault Secrets Officer` auf Vault-Scope zu |
| [`08_sleep_propagation.sh`](./08_sleep_propagation.sh) | Pausiert 10 Sekunden für die weltweite Replikation der RBAC-Berechtigungen |
| [`09_az_keyvault_secret_set_initial.sh`](./09_az_keyvault_secret_set_initial.sh) | Speichert das Secret `db-password` (`test`) inklusive Expiration Date |
| [`10_az_keyvault_secret_set_updated.sh`](./10_az_keyvault_secret_set_updated.sh) | Erzeugt eine neue Version des Secrets `db-password` mit dem Wert `test123` |
| [`11_az_keyvault_secret_list_versions.sh`](./11_az_keyvault_secret_list_versions.sh) | Listet alle historischen und aktiven Versionen des Secrets tabellarisch auf |
| [`12_export_vm.sh`](./12_export_vm.sh) | `export VM="key-vault-vm"` |
| [`13_az_vm_create.sh`](./13_az_vm_create.sh) | Erstellt die Ubuntu 22.04 LTS VM `key-vault-vm` |
| [`14_az_vm_identity_assign.sh`](./14_az_vm_identity_assign.sh) | Aktiviert die System-Assigned Managed Identity der VM und speichert `VM_PRINCIPAL_ID` |
| [`15_az_role_assignment_create_secrets_user.sh`](./15_az_role_assignment_create_secrets_user.sh) | Weist der VM-Identität die Least-Privilege-Rolle `Key Vault Secrets User` zu |
| [`16_az_vm_run_command_install_cli.sh`](./16_az_vm_run_command_install_cli.sh) | Installiert die Azure CLI via Run-Command remote auf der Linux-VM |
| [`17_az_vm_run_command_verify_cli.sh`](./17_az_vm_run_command_verify_cli.sh) | Überprüft die CLI-Installation auf der VM (`az --version`) |
| [`18_az_vm_run_command_login_identity.sh`](./18_az_vm_run_command_login_identity.sh) | Authentifiziert die Azure CLI auf der VM via Managed Identity (`az login --identity`) |
| [`19_az_keyvault_secret_show.sh`](./19_az_keyvault_secret_show.sh) | Ruft den Klartextwert des Secrets sicher ab |
| [`20_az_group_delete.sh`](./20_az_group_delete.sh) | Bereinigt alle Ressourcen durch Löschen der Resource Group |

---

## Workflow & Erläuterungen

### 1. Azure Key Vault mit RBAC-Autorisierung

Herkömmliche Key Vaults nutzten Vault Access Policies, bei denen Berechtigungen grobgranulär und unabhängig von Azure RBAC verwaltet wurden. Mit `--enable-rbac-authorization true` wird die Autorisierung nahtlos an Microsoft Entra ID übergeben. Dadurch greifen einheitliche IAM-Prozesse, PIM (Privileged Identity Management) und Audit-Logs für Data-Plane-Operationen.

### 2. Secret-Lifecycle & Versionierung

Sobald ein Secret (`az keyvault secret set`) unter demselben Namen erneut gespeichert wird, überschreibt Key Vault den alten Wert nicht destruktiv, sondern legt eine neue kryptografisch unveränderliche Version an. Über `az keyvault secret list-versions` können ältere Stände nachvollzogen und bei Bedarf referenziert werden. Das Setzen von `--expires` erzwingt Sicherheitsrichtlinien für regelmäßige Rotation.

### 3. Zero-Secret-Architektur mit Managed Identities

Um Zugangsdaten (wie API-Keys oder Datenbankpasswörter) nicht im Quellcode oder in Konfigurationsdateien auf der VM speichern zu müssen, wird die System-Assigned Managed Identity der VM genutzt:

- Die VM erhält eine eindeutige Identität (`principalId`) in Microsoft Entra ID.
- Dieser Identität wird über Azure RBAC die Rolle **`Key Vault Secrets User`** zugewiesen (ausschließlich Lesezugriff auf Geheimnisse).
- Über den lokalen Azure Instance Metadata Service (IMDS, `169.254.169.254`) fordert die VM kurzlebige OAuth-2.0-Tokens an (`az login --identity`), um autorisiert auf den Key Vault zuzugreifen.
