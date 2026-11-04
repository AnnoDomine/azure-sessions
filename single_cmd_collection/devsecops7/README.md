# DevSecOps 7: Container Security & Delivery (Azure Container Registry & Docker)

Themenschwerpunkte sind die Bereitstellung einer sicheren, privaten **Azure Container Registry (ACR)**, die Registrierung des zuständigen Azure Resource Providers, die nahtlose Authentifizierung des lokalen Docker-Daemons via Azure CLI (`az acr login`), der Build- und Tagging-Prozess von Container-Images, das Hochladen (Push) und Beziehen (Pull) über private Registries sowie das Verwalten des Lebenszyklus von Containern und Images.

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Alle Basis-Umgebungsvariablen (`RG`, `REGION`, `ACR`, `CONTAINER`, `CONTAINER_LINK`) gesammelt |
| [`01_export_rg.sh`](./01_export_rg.sh) | `export RG="devsecops7-lab-rg"` |
| [`02_export_region.sh`](./02_export_region.sh) | `export REGION="germanywestcentral"` |
| [`03_export_acr.sh`](./03_export_acr.sh) | Generiert einen global eindeutigen ACR-Namen `devsecops7acr<random-hex>` |
| [`04_az_group_create.sh`](./04_az_group_create.sh) | Erstellt die Azure Resource Group `devsecops7-lab-rg` |
| [`05_az_provider_register.sh`](./05_az_provider_register.sh) | Registriert den Azure Resource Provider `Microsoft.ContainerRegistry` |
| [`06_az_acr_create.sh`](./06_az_acr_create.sh) | Erstellt die Azure Container Registry im `Basic`-SKU |
| [`07_export_wsl_path.sh`](./07_export_wsl_path.sh) | Ergänzt den Windows Docker Desktop Bin-Pfad für WSL-Umgebungen |
| [`08_az_acr_login.sh`](./08_az_acr_login.sh) | Authentifiziert den Docker-Daemon an der ACR (`az acr login`) |
| [`09_export_container_vars.sh`](./09_export_container_vars.sh) | Definiert `CONTAINER` und den vollqualifizierten `CONTAINER_LINK` |
| [`10_docker_build.sh`](./10_docker_build.sh) | Baut das Docker-Image mit lokalem und ACR-Repository-Tag |
| [`11_docker_push.sh`](./11_docker_push.sh) | Pushed das gebaute Container-Image in die Azure Container Registry |
| [`12_az_acr_repository_list.sh`](./12_az_acr_repository_list.sh) | Listet alle Repositories in der ACR tabellarisch auf |
| [`13_docker_rmi_local.sh`](./13_docker_rmi_local.sh) | Entfernt das ACR-Image lokal vom Docker-Host |
| [`14_docker_pull.sh`](./14_docker_pull.sh) | Zieht das Container-Image aus der privaten Azure Container Registry |
| [`15_docker_image_ls.sh`](./15_docker_image_ls.sh) | Zeigt alle lokalen Docker-Images zur Überprüfung an |
| [`16_docker_run.sh`](./16_docker_run.sh) | Startet einen Container im Hintergrund mit Port-Mapping `5050:5050` |
| [`17_docker_stop.sh`](./17_docker_stop.sh) | Stoppt den laufenden Container |
| [`18_docker_image_remove.sh`](./18_docker_image_remove.sh) | Löscht das lokale Docker-Image |
| [`19_az_group_delete.sh`](./19_az_group_delete.sh) | Bereinigt alle Ressourcen durch Löschen der Resource Group |

---

## Workflow & Erläuterungen

### 1. Azure Container Registry (ACR) & Provider-Registrierung

Die Azure Container Registry dient als private OCI-konforme Docker-Registry innerhalb der Microsoft Azure Cloud. Vor dem ersten Erstellen einer ACR muss sichergestellt sein, dass der Resource Provider `Microsoft.ContainerRegistry` für die Subscription registriert ist. Mit `az provider register --namespace Microsoft.ContainerRegistry --wait` wird dieser Vorgang synchron abgewickelt.

Die ACR wird mit dem SKU `Basic` erstellt, welcher für Entwicklungs-, Test- und kleine Produktionsszenarien ideal ist und grundlegende Funktionen (Authentifizierung, Webhooks, Storage) bereitstellt.

### 2. Schlüssellose Authentifizierung via Azure CLI (`az acr login`)

Anstatt statische Administrator-Passwörter oder API-Keys im Docker-Daemon zu hinterlegen, nutzt `az acr login --name $ACR` das aktive Entra-ID-Token der Azure CLI. Das Azure CLI fordert im Hintergrund ein kurzlebiges Zugriffstoken für die Registry an und injiziert dieses direkt in die Docker-Konfiguration (`~/.docker/config.json`). Dies verhindert Credential Leakage auf Entwickler-Workstations und CI/CD-Runnern.

### 3. Image-Tagging & Registry-Push

Damit Docker ein Image in eine private Registry übertragen kann, muss das Image dem vollqualifizierten Pfad der Registry entsprechen:
```text
<registry-name>.azurecr.io/<repository-name>:<tag>
```
Beim Build-Vorgang (`docker build -t "$CONTAINER_LINK" -t "$CONTAINER:latest" .`) werden direkt zwei Tags vergeben: Ein lokaler Alias (`dev-sec-ops-7:latest`) und der FQDN-Tag für Azure (`<acr>.azurecr.io/dev-sec-ops-7:latest`). Anschließend lädt `docker push` die Image-Layer verschlüsselt in den Speicher der ACR hoch.

### 4. Verifikation & Pull-Roundtrip

Zur Überprüfung, ob das Image tatsächlich in der Registry verfügbar ist und Berechtigungen korrekt greifen:
1. `az acr repository list` listet die Repositories im Tenant auf.
2. `docker rmi "$CONTAINER_LINK"` löscht das lokale Image vom Host.
3. `docker pull "$CONTAINER_LINK"` lädt das Image erneut über die gesicherte Verbindung aus der ACR herunter.

### 5. Lokale Ausführung & Port-Mapping

Mit `docker run -d -p 5050:5050 --name "$CONTAINER" "$CONTAINER_LINK"` wird der Container detached gestartet und Port 5050 des Hosts auf Port 5050 des Containers weitergeleitet. Nach dem Testen wird der Container gestoppt (`docker stop`) und bereinigt (`docker image remove`).
