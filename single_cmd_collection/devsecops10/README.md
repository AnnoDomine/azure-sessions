# DevSecOps 10: Kubernetes & Container Orchestration (Minikube & Workloads)

Themenschwerpunkte sind die Einrichtung und Nutzung eines lokalen **Kubernetes**-Clusters mittels **Minikube** und der CLI **kubectl**, das Deklarieren und Verwalten von Workloads (**Deployments** und **Pods**), das Testen von Ausfallsicherheit und Selbstheilung (**Self-Healing**), Service-Exposition und Routing über **NodePort**, horizontales Skalieren mit automatischem **Load Balancing**, unterbrechungsfreie Aktualisierungen (**Rolling Updates**) sowie die Fehlerdiagnose und automatisierte Rollbacks (**Rollback**).

---

## Übersicht der Dateien

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Zentrale Umgebungsvariablen (`KUBERNETES_NAMESPACE`, `KUBERNETES_LAB_NAMESPACE`) |
| [`01_install_kubectl.sh`](./01_install_kubectl.sh) | Download des offiziellen kubectl-Binaries & SHA256-Integritätsprüfung |
| [`02_install_kubectl_binary.sh`](./02_install_kubectl_binary.sh) | Installation von kubectl (`/usr/local/bin` oder `~/.local/bin`) |
| [`03_verify_kubectl.sh`](./03_verify_kubectl.sh) | Überprüfung der installierten kubectl Client-Version |
| [`04_install_minikube.sh`](./04_install_minikube.sh) | Download und Installation des Minikube-Binaries |
| [`05_minikube_start.sh`](./05_minikube_start.sh) | Start des lokalen Minikube-Clusters mit dem Docker-Treiber |
| [`06_minikube_status.sh`](./06_minikube_status.sh) | Überprüfung des Minikube Cluster-, Kubelet- und API-Server-Status |
| [`07_kubectl_get_nodes.sh`](./07_kubectl_get_nodes.sh) | Anzeige aller registrierten Cluster-Knoten (Nodes) |
| [`08_create_bootcamp_deployment.sh`](./08_create_bootcamp_deployment.sh) | Erstellung des Initial-Deployments `kubernetes-bootcamp` (Version v1) |
| [`09_kubectl_get_deployments_pods.sh`](./09_kubectl_get_deployments_pods.sh) | Abfrage des aktuellen Status von Deployments und Pods |
| [`10_minikube_dashboard.sh`](./10_minikube_dashboard.sh) | Start und Aufruf des webbasierten Kubernetes Dashboards |
| [`11_export_pod_name.sh`](./11_export_pod_name.sh) | Ermittlung und Export des aktiven Pod-Namens (`POD_NAME`) |
| [`12_kubectl_describe_pod.sh`](./12_kubectl_describe_pod.sh) | Detaillierte Inspektion von Pod-Spezifikationen, IP und Events |
| [`13_kubectl_logs.sh`](./13_kubectl_logs.sh) | Abruf der Container-Logs (stdout/stderr) des Pods |
| [`14_kubectl_exec_interactive.sh`](./14_kubectl_exec_interactive.sh) | Start einer interaktiven Bash-Sitzung innerhalb des Pod-Containers |
| [`15_create_nginx_deployment.sh`](./15_create_nginx_deployment.sh) | Bereitstellung eines zweiten Deployments mit dem Nginx-Image |
| [`16_scale_nginx_deployment.sh`](./16_scale_nginx_deployment.sh) | Horizontales Skalieren des Nginx-Deployments auf 3 Replikate |
| [`17_kubectl_get_deployments_yaml.sh`](./17_kubectl_get_deployments_yaml.sh) | Export und Analyse der deklarativen YAML-Definitionen beider Deployments |
| [`18_kubectl_delete_pod_resilience.sh`](./18_kubectl_delete_pod_resilience.sh) | Löschen eines Pods zur Demonstration der Kubernetes Self-Healing-Funktion |
| [`19_kubectl_expose_nodeport.sh`](./19_kubectl_expose_nodeport.sh) | Freigabe des Bootcamp-Deployments als NodePort-Service auf Port 8080 |
| [`20_kubectl_get_services.sh`](./20_kubectl_get_services.sh) | Übersicht aller konfigurierten Cluster-Services und Port-Mappings |
| [`21_export_bootcamp_url.sh`](./21_export_bootcamp_url.sh) | Zusammenbau der vollständigen HTTP-Endpunkt-URL (`BOOTCAMP_URL`) |
| [`22_curl_bootcamp_service.sh`](./22_curl_bootcamp_service.sh) | Funktionstest des exponierten Services via HTTP-Request (curl) |
| [`23_scale_bootcamp_deployment.sh`](./23_scale_bootcamp_deployment.sh) | Skalierung des Bootcamp-Deployments auf 4 Replikate |
| [`24_test_load_balancing.sh`](./24_test_load_balancing.sh) | Validierung des internen Service Round-Robin Load Balancings |
| [`25_rollout_update_v2.sh`](./25_rollout_update_v2.sh) | Durchführung eines Rolling Updates auf Image-Version v2 |
| [`26_rollout_status.sh`](./26_rollout_status.sh) | Live-Überwachung des Update-Rollouts bis zur vollständigen Bereitschaft |
| [`27_curl_bootcamp_v2.sh`](./27_curl_bootcamp_v2.sh) | Verifikation der Version v2 über den Service-Endpunkt |
| [`28_rollout_broken_image.sh`](./28_rollout_broken_image.sh) | Simulation eines fehlerhaften Updates mit nicht-existentem Image (v10) |
| [`29_diagnose_broken_pod.sh`](./29_diagnose_broken_pod.sh) | Ursachenanalyse des Fehlers `ImagePullBackOff` via Event-Logs |
| [`30_rollout_undo.sh`](./30_rollout_undo.sh) | Automatisches Rollback auf die vorherige lauffähige Version |
| [`31_cleanup_resources.sh`](./31_cleanup_resources.sh) | Vollständige Bereinigung aller erstellten Deployments und Services |

---

## Workflow & Erläuterungen

### 1. Tooling & Cluster-Setup (kubectl & Minikube)

- **kubectl**: Das offizielle Command-Line-Interface zur Kommunikation mit dem Kubernetes API-Server. Nach dem Download wird die Binärdatei anhand einer offiziellen SHA256-Prüfsumme validiert und in den Ausführungspfad integriert.
- **Minikube**: Ermöglicht das lokale Ausführen eines vollständigen Single-Node-Kubernetes-Clusters direkt auf der Entwickler-Maschine. Über `--driver=docker` wird der Control-Plane- und Worker-Knoten als isolierter Docker-Container ausgeführt.
- Mit `minikube status` und `kubectl get nodes` wird die ordnungsgemäße Initialisierung der Control-Plane und des Node-Zustands (`Ready`) sichergestellt.

### 2. Workload-Management: Deployments & Pods

Ein **Pod** ist die kleinste deploybare Einheit in Kubernetes und kapselt einen oder mehrere Container mit gemeinsam genutztem Netzwerk- und Speicher-Namespace. Ein **Deployment** fungiert als übergeordnete Abstraktionsebene, die den Sollzustand (Replikatanzahl, Container-Images, Labels) deklariert und über ReplicaSets steuert:
- `kubectl create deployment kubernetes-bootcamp --image=...` erstellt ein Deployment mit standardmäßig einer Pod-Instanz.
- Anhand von Selektor-Labels (`-l app=kubernetes-bootcamp`) können Pods dynamisch adressiert und gefiltert werden (`jsonpath='{.items[0].metadata.name}'`).
- Mit `kubectl describe pod` und `kubectl logs` können Lifecycle-Events, Ressourcenzuordnungen und Fehlermeldungen eingesehen werden.
- `kubectl exec -it <pod-name> -- bash` öffnet eine interaktive Shell im Container zur Laufzeitinspektion.

### 3. Deklaratives Skalieren & Desired-State-Prinzip (Self-Healing)

Kubernetes folgt einem kontinuierlichen **Reconciliation Loop**: Der Controller vergleicht stetig den Ist-Zustand (Actual State) mit dem definierten Soll-Zustand (Desired State).
- **Skalierung**: Mittels `kubectl scale deployment <name> --replicas=3` passt der Deployment-Controller die Anzahl der Pod-Instanzen deklarativ an.
- **Selbstheilung**: Wird ein Pod manuell gelöscht (`kubectl delete pod <pod-name>`), erkennt der Controller die Diskrepanz zur Soll-Replikatanzahl und instanziiert ohne manuelles Eingreifen sofort einen neuen Ersatz-Pod mit neuer Pod-ID.

### 4. Service-Exposition & Round-Robin Load Balancing

Pods sind flüchtig (ephemeral) und erhalten bei jedem Neustart eine neue interne IP-Adresse. Ein **Service** stellt eine persistente Abstraktionsschicht und einen stabilen Netzwerk-Endpunkt bereit:
- **NodePort Service**: Bei `kubectl expose deployment/<name> --type="NodePort" --port 8080` reserviert Kubernetes einen Port im Bereich 30000–32767 auf dem Host/Node und routet externen Traffic transparent an Port 8080 der Ziel-Pods weiter.
- **Lastverteilung**: Sind mehrere Pod-Replikate hinter einem Service aktiv, verteilt der integrierte Kube-Proxy bzw. CoreDNS den eingehenden Datenverkehr im Round-Robin-Verfahren gleichmäßig über alle gesunden Endpunkte.

### 5. Zero-Downtime Rolling Updates & Automatisierte Rollbacks

Deployments unterstützen unterbrechungsfreie Aktualisierungen ohne Downtime:
- **Rolling Update**: Bei `kubectl set image deployments/<name> <container>=<image>:v2` startet Kubernetes inkrementell neue Pods mit der neuen Version und terminiert alte Pods erst, wenn die neuen Instanzen betriebsbereit (`Ready`) sind.
- **Zero-Downtime-Schutz bei Fehlern**: Wird versehentlich ein ungültiges oder nicht existierendes Image deployed (`:v10`), wechseln die neuen Pods in den Fehlerzustand `ImagePullBackOff`. Kubernetes bricht den Rollout ab und belässt alle existierenden, gesunden Pods der vorherigen Version unberührt im Produktivbetrieb.
- **Rollback**: Mit dem Befehl `kubectl rollout undo deployments/<name>` wird das Deployment per sofortigem Revert auf die letzte funktionierende Revision zurückgesetzt.

### 6. Ressourcenbereinigung

Zur Vermeidung verwaister Ressourcen auf der lokalen Maschine werden über `kubectl delete deployments/...` und `kubectl delete services/...` alle Workloads und Dienstendpunkte sauber entfernt.
