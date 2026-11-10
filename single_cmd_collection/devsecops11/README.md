# DevSecOps 11: Kubernetes on Azure (AKS, ACR & Stateful Workloads)

Themenschwerpunkte dieser Session sind die Bereitstellung eines produktionsnahen **Azure Kubernetes Service (AKS)** Clusters mittels **Terraform (IaC)**, die Anbindung einer privaten **Azure Container Registry (ACR)** unter Nutzung von **System-Assigned Managed Identity** und **RBAC (`AcrPull`)**, die Bereitstellung hochverfügbarer Web-Workloads mit **Azure Load Balancern**, die Implementierung persistenter Speicherarchitekturen über **StatefulSets** und **Azure Managed Disks (Persistent Volume Claims)** sowie das saubere Lifecycle-Management und Cleanup.

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Zentrale Umgebungsvariablen (`RG`, `CLUSTER`, `REGION`, `ACR`, `CONTAINER`, Namespaces) |
| [`01_git_clone_repo.sh`](./01_git_clone_repo.sh) | Klonen des AKS-Terraform-Repositories (`kubernetes-on-azure`) und Verzeichniswechsel |
| [`02_check_cli_versions.sh`](./02_check_cli_versions.sh) | Überprüfung der installierten Versionen von `terraform` und `az` CLI |
| [`03_az_account_list.sh`](./03_az_account_list.sh) | Anzeige der Azure-Subscriptions zur Pflege der `subscription_id` in `terraform.tfvars` |
| [`04_terraform_init.sh`](./04_terraform_init.sh) | Initialisierung des Terraform-Verzeichnisses und Download des `azurerm`-Providers |
| [`05_terraform_plan.sh`](./05_terraform_plan.sh) | Erstellung und Prüfung des deklarativen Ausführungsplans für den AKS-Cluster |
| [`06_terraform_apply.sh`](./06_terraform_apply.sh) | Bereitstellung des AKS-Clusters und der Basis-Resource-Group via Terraform |
| [`07_az_aks_get_credentials.sh`](./07_az_aks_get_credentials.sh) | Download der AKS-Kubeconfig und Konfiguration des lokalen `kubectl`-Kontexts |
| [`08_kubectl_get_nodes_pods.sh`](./08_kubectl_get_nodes_pods.sh) | Validierung der Cluster-Konnektivität und Abfrage der Worker-Nodes (`kubectl get nodes`) |
| [`09_create_dockerfile.sh`](./09_create_dockerfile.sh) | Erstellung eines minimalen Python-Dockerfiles (`python:3-slim`) für das Demo-Image |
| [`10_az_provider_register_acr.sh`](./10_az_provider_register_acr.sh) | Registrierung des Ressourcenanbieters `Microsoft.ContainerRegistry` |
| [`11_az_acr_create.sh`](./11_az_acr_create.sh) | Bereitstellung der privaten Azure Container Registry (`Basic`-SKU) |
| [`12_az_acr_login.sh`](./12_az_acr_login.sh) | Tokenbasierte Entra-ID-Authentifizierung des Docker-Daemons an der ACR |
| [`13_docker_build_push.sh`](./13_docker_build_push.sh) | Lokales Bauen und Veröffentlichen des Container-Images in der ACR (`docker push`) |
| [`14_create_acr_deployment_yaml.sh`](./14_create_acr_deployment_yaml.sh) | Deklarative Generierung des Kubernetes-Deployment-Manifests (`deployment.yaml`) |
| [`15_kubectl_apply_acr_deployment.sh`](./15_kubectl_apply_acr_deployment.sh) | Erstes Ausrollen des Deployments & Demonstration des Authentifizierungsfehlers (`ImagePullBackOff`) |
| [`16_export_kubelet_and_acr_ids.sh`](./16_export_kubelet_and_acr_ids.sh) | Ermittlung von ACR-ID, Kubelet-Identität (Managed Identity) und dynamischer RBAC-Rolle |
| [`17_az_role_assignment_kubelet_acr.sh`](./17_az_role_assignment_kubelet_acr.sh) | Vergabe der Berechtigung `AcrPull` an die Kubelet-Identität des Clusters |
| [`18_az_aks_check_and_attach_acr.sh`](./18_az_aks_check_and_attach_acr.sh) | Diagnose via `az aks check-acr` und native Cluster-Anbindung via `az aks update --attach-acr` |
| [`19_verify_acr_deployment_running.sh`](./19_verify_acr_deployment_running.sh) | Re-Deployment und Verifikation des erfolgreichen Pod-Starts (`Running`) |
| [`20_create_nginx_demo_manifests.sh`](./20_create_nginx_demo_manifests.sh) | Erstellung der Manifeste für Demo 2 (Namespace, Nginx-Deployment mit 3 Replikaten & Service) |
| [`21_kubectl_apply_nginx_demo.sh`](./21_kubectl_apply_nginx_demo.sh) | Bereitstellung der Nginx-Web-Workload im Namespace `demo2-loadbalancer` |
| [`22_kubectl_watch_nginx_loadbalancer.sh`](./22_kubectl_watch_nginx_loadbalancer.sh) | Live-Überwachung (`-w`) der Provisionierung der externen Azure Load Balancer IP |
| [`23_create_statefulset_configmap.sh`](./23_create_statefulset_configmap.sh) | Erstellung der ConfigMap mit Python-HTTP-Server (`app.py`) und Sticky-Notes-Frontend (`index.html`) |
| [`24_create_statefulset_manifests.sh`](./24_create_statefulset_manifests.sh) | Erstellung der StatefulSet-Manifeste mit dynamischem PVC (1Gi Azure Managed Disk) |
| [`25_kubectl_apply_statefulset.sh`](./25_kubectl_apply_statefulset.sh) | Ausrollen der StatefulSet-Applikation im Namespace `demo3-statefulset` |
| [`26_kubectl_get_statefulset_pods.sh`](./26_kubectl_get_statefulset_pods.sh) | Überprüfung des StatefulSet-Pods (`demo3-0`) und des gebundenen Persistent Volumes |
| [`27_terraform_destroy.sh`](./27_terraform_destroy.sh) | Rückstandsfreie Deprovisionierung des AKS-Clusters via `terraform destroy` |
| [`28_az_group_delete.sh`](./28_az_group_delete.sh) | Löschen der Azure Resource Group und verbleibender ACR-Ressourcen (`az group delete`) |

---

## Workflow & Erläuterungen

### 1. Infrastructure as Code (IaC) mit Terraform & AKS

Anstelle einer manuellen Clustererstellung über das Portal oder CLI-Kommandos wird die AKS-Infrastruktur deklarativ über **Terraform** definiert:
- Die Konfiguration in `kubernetes-on-azure/terraform/` provisioniert eine Resource Group (`rg-dev-aks`) und einen AKS-Cluster (`aks-west-eu`) mit System-Assigned Managed Identity und einem konfigurierbaren Node Pool.
- Vor dem Ausführen von `terraform apply` wird die Subscription-ID des aktiven Kontos über `az account list` geprüft und in `terraform.tfvars` hinterlegt.
- Nach erfolgreichem Apply verbindet `az aks get-credentials` die lokale Toolchain (`kubectl`) nahtlos mit der API-Control-Plane des Cloud-Clusters.

### 2. Private Image Registry & Schlüssellose Kubelet-Authentifizierung (ACR & AKS Integration)

In Produktivumgebungen werden Container-Images in privaten Registries geschützt. Der AKS-Cluster benötigt Berechtigungen, um Images aus der **Azure Container Registry (ACR)** herunterzuladen:
- **Image Build & Push**: Nach dem Registrieren des Resource Providers `Microsoft.ContainerRegistry` wird eine ACR erstellt. Über `az acr login` authentifiziert sich Docker ohne statische Zugangsdaten. Das Image wird lokal gebaut und in die ACR gepusht.
- **ImagePullBackOff Demonstration**: Wird ein Deployment mit dem ACR-Image ausgerollt, bevor der AKS-Cluster autorisiert wurde, scheitert der Kubelet-Agent beim Image-Pull (`401 Unauthorized`), und der Pod wechselt in den Zustand `ImagePullBackOff`.
- **System-Assigned Identity & Role Assignment**: Die Kubelet-Komponente des AKS-Clusters besitzt eine eigene Managed Identity (`identityProfile.kubeletidentity.objectId`). Durch die Zuweisung der Azure-RBAC-Rolle `AcrPull` (oder bei ABAC `Container Registry Repository Reader`) erhält das Kubelet Leserechte auf die ACR.
- Alternativ bzw. ergänzend verknüpft `az aks update --attach-acr` die Registry direkt mit dem Cluster. Nach dem Re-Apply startet der Container ohne statische Pull-Secrets (`imagePullSecrets`) erfolgreich.

### 3. Skalierte Workloads & Layer-4 Azure Load Balancing

Für zustandslose HTTP-Dienste deklariert Kubernetes Service-Ressourcen:
- **Service Type `LoadBalancer`**: Kubernetes interagiert über den Azure Cloud Controller Manager mit der Azure-Plattform. Bei der Deklaration von `type: LoadBalancer` provisioniert Azure automatisch einen externen **Azure Standard Load Balancer**, konfiguriert Frontend-IPs, Health Probes und Routing-Regeln.
- Das Nginx-Deployment mit 3 Replikaten wird im isolierten Namespace `demo2-loadbalancer` bereitgestellt. Sobald die öffentliche IP (`EXTERNAL-IP`) zugewiesen ist, verteilt der Load Balancer den eingehenden HTTP-Traffic redundant auf die Pods.

### 4. Stateful Workloads & Dynamischer Persistenter Speicher (StatefulSet & PVC)

Zustandsbehaftete Anwendungen (Datenbanken, Dateispeicher) erfordern stabile Netzwerkidentitäten und persistente Speichermedien:
- **StatefulSet vs. Deployment**: Während Pods in Deployments austauschbar und flüchtig sind, erhalten Pods in einem StatefulSet deterministische Namen (`demo3-0`) und werden geordnet gestartet/gestoppt.
- **PersistentVolumeClaim (PVC) via VolumeClaimTemplates**: Im Manifest wird ein `volumeClaimTemplates` für `1Gi` Speicher definiert. Der AKS-Cluster nutzt die Standard-StorageClass (Azure Disk CSI-Treiber), um im Hintergrund automatisch eine **Azure Managed Disk** zu erstellen, an den Worker-Node anzuhängen und unter `/data/notes` in den Container zu mounten.
- **ConfigMap Entkopplung**: Der Anwendungscode (`app.py`) und das UI (`index.html`) werden über eine Kubernetes `ConfigMap` injiziert, sodass Codeänderungen ohne erneuten Docker-Image-Build getestet werden können.
- Daten, die in die Notizen-App eingetragen werden, überstehen Pod-Neustarts und Ausfälle unbeschadet auf der persistenten Azure-Festplatte.

### 5. Korrekturen gegenüber dem Ausgangsskript (`devsecops11.sh`)

- **Syntax-Fehler bei Bash-Variablenexpansion**: Im ursprünglichen Skript wurde in den Manifesten für Namespace, Service und StatefulSet fälschlicherweise `${demo3-statefulset}` anstelle der definierten Variablen `${SF_NS}` verwendet. Dies führte zu fehlerhaften YAML-Strukturen und wurde behoben.
- **Fehlende Region-Definition**: Die Variable `$REGION` (`westeurope`) wurde in `00_env_variables.sh` explizit definiert, um unbeabsichtigte Fehler bei `az group create` und `az acr create` zu verhindern.
- **Explizite Manifest-Bereitstellung**: Statt eines pauschalen `kubectl apply -f .` werden die erzeugten YAML-Dateien in der korrekten logischen Reihenfolge gezielt angewendet.
- **Bash-Syntax**: Sämtliche mehrzeiligen CLI-Befehle wurden von Inline-Kommentaren bereinigt und mit strukturierten Parametererklärungen versehen.
