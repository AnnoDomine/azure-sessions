# Cybersteps Azure CLI Labs

Eine minimalistische Wissens- und Befehlsdatenbank für die **Azure Sessions** auf Cybersteps unter Nutzung der **Azure CLI (`az`)** auf einer Linux-Distribution.

Jede Session enthält modulare Einzelbefehle inklusive ausführlicher Erklärungen zu den Parametern.

---

## Sessions

| Session | Thema | Einzelbefehle |
| --- | --- | --- |
| **Cloud 3** | Virtual Networking (VNets, Subnetze, VMs, Bastion, Run-Command) | [`single_cmd_collection/cloud3/`](./single_cmd_collection/cloud3/) |
| **Cloud 4** | Storage & Databases (Storage Accounts, Blobs, SAS, Access Tiers) | [`single_cmd_collection/cloud4/`](./single_cmd_collection/cloud4/) |
| **Cloud 5** | Load Balancing & WAF (Standard LB, App Gateway, OWASP WAF, Network Watcher) | [`single_cmd_collection/cloud5/`](./single_cmd_collection/cloud5/) |
| **Cloud 6** | Identity & Access Management (Entra ID, RBAC Role Assignments, Managed Identity) | [`single_cmd_collection/cloud6/`](./single_cmd_collection/cloud6/) |
| **Cloud 7** | Governance & Monitoring (Resource Locks, Azure Policy, Monitor, Tags, Advisor) | [`single_cmd_collection/cloud7/`](./single_cmd_collection/cloud7/) |
| **Cloud 8** | FinOps & Cost Management (Advisor Cost, VM Deallocate/Auto-Shutdown, Unattached Disks, Budgets, Tag-Policy) | [`single_cmd_collection/cloud8/`](./single_cmd_collection/cloud8/) |
| **Cloud 9** | Defender for Cloud & Security Auditing (Prowler) | [`single_cmd_collection/cloud9/`](./single_cmd_collection/cloud9/) |
| **DevSecOps 4** | Secrets Management (Azure Key Vault, RBAC & Managed Identity) | [`single_cmd_collection/devsecops4/`](./single_cmd_collection/devsecops4/) |
| **DevSecOps 7** | Container Security & Delivery (Azure Container Registry & Docker) | [`single_cmd_collection/devsecops7/`](./single_cmd_collection/devsecops7/) |
| **DevSecOps 8** | IaC & Terraform Intro (AzureRM Provider, State, Drift & Import) | [`single_cmd_collection/devsecops8/`](./single_cmd_collection/devsecops8/) |
| **DevSecOps 10** | Kubernetes & Container Orchestration (Minikube, Deployments, Scaling & Services) | [`single_cmd_collection/devsecops10/`](./single_cmd_collection/devsecops10/) |
| **DevSecOps 11** | Kubernetes on Azure (AKS, ACR Integration, Load Balancing & StatefulSets) | [`single_cmd_collection/devsecops11/`](./single_cmd_collection/devsecops11/) |
| **DevSecOps 12** | Kubernetes Security (Attack Chain, RBAC Hardening, Node Escape & Kubescape) | [`single_cmd_collection/devsecops12/`](./single_cmd_collection/devsecops12/) |
| **DevSecOps 13** | Kubernetes Goat (Helm, Minikube & 22 Security-Szenarien) | [`single_cmd_collection/devsecops13/`](./single_cmd_collection/devsecops13/) ([Solutions](./single_cmd_collection/devsecops13/solutions/README.md)) |

---

## Repository-Struktur

```text
.
├── AGENTS.md                  # Verhaltensregeln für AI-Agents (Ausführungsverbot)
├── README.md                  # Zentrale Übersicht (dieses Dokument)
├── Dockerfile                 # Beispiel Dockerfile
└── single_cmd_collection/     # Modulare Befehlssammlung nach Sessions unterteilt
    ├── README.md              # Übersicht über alle Sessions in der Sammlung
    ├── cloud3/                # Einzelbefehle für Cloud 3
    ├── cloud4/                # Einzelbefehle für Cloud 4
    ├── cloud5/                # Einzelbefehle für Cloud 5
    ├── cloud6/                # Einzelbefehle für Cloud 6
    ├── cloud7/                # Einzelbefehle für Cloud 7
    ├── cloud8/                # Einzelbefehle für Cloud 8
    ├── cloud9/                # Einzelbefehle für Cloud 9
    ├── devsecops4/            # Einzelbefehle für DevSecOps 4
    ├── devsecops7/            # Einzelbefehle für DevSecOps 7
    ├── devsecops8/            # Einzelbefehle für DevSecOps 8
    ├── devsecops10/           # Einzelbefehle für DevSecOps 10
    ├── devsecops11/           # Einzelbefehle für DevSecOps 11
    ├── devsecops12/           # Einzelbefehle für DevSecOps 12
    └── devsecops13/           # Einzelbefehle & Szenario-Doku für DevSecOps 13
```

---

## Themenübersicht

### Cloud 3 – Virtual Networking

- **Ressourcenverwaltung**: Erstellen einer dedizierten Resource Group (`az group create`)
- **Netzwerkarchitektur**: VNet (`10.10.0.0/16`) mit 3 isolierten Schichten (`web-subnet`, `app-subnet`, `db-subnet`)
- **Compute**: VM-Bereitstellung mit SSH-Schlüsseln ohne Public IPs
- **Remote Execution**: Software-Installation (Nginx) via Azure VM Agent (`az vm run-command invoke`)
- **Zero-Trust Access**: Konfiguration von Azure Bastion inkl. `AzureBastionSubnet` und nativer SSH-Tunneling-Verbindung (`az network bastion ssh`)

### Cloud 4 – Storage & Databases

- **Storage Account & Container**: Bereitstellung von Blob Storage und privaten Containern
- **Blob Operations**: Upload, Download, Listung und Löschen von Blobs
- **Lifecycle & Access Tiers**: Dynamischer Wechsel zwischen `Hot`- und `Cool`-Tiers
- **Sicherheits- & Zugriffssteuerung**: Generierung zeitlich beschränkter SAS-Tokens (`az storage blob generate-sas`), sowie Verwaltung des anonymen Public-Blob-Zugriffs auf Account- und Container-Ebene

### Cloud 5 – Load Balancing & Web Application Firewall (WAF)

- **Layer-4 Load Balancing**: Bereitstellung eines `Standard` Azure Load Balancers inkl. Frontend-IP, Backend-Pool, TCP Health Probe und HTTP-Verteilungsregel (`az network lb`)
- **Automatisiertes Backend-Provisioning**: Schleifenbasierte Erstellung redundanter Web-VMs (`web1`, `web2`), Nginx-Rollout via `run-command`, NIC-Pool-Registrierung und NSG-Freigaben
- **High Availability & Failover**: Simulation eines Knotenausfalls (`az vm stop` / `az vm start`)
- **Layer-7 Application Gateway & WAF**: Bereitstellung eines Application Gateways (`WAF_v2`) mit vorgeschalteter `OWASP 3.2` WAF-Policy im `Prevention`-Modus
- **Netzwerkdiagnose**: Überprüfung effektiver NSG-Sicherheitsregeln mittels Azure Network Watcher (`az network watcher test-ip-flow`)

### Cloud 6 – Identity & Access Management (IAM & RBAC)

- **Entra ID & Principal Discovery**: Auslesen des aktuell angemeldeten Benutzers (`az ad signed-in-user show`) und der Subscription-ID
- **RBAC Role Inspection**: Abfragen von Built-in Rollendefinitionen (`az role definition list --name Reader`) und bestehenden Role Assignments (`az role assignment list`)
- **Managed Identity**: Bereitstellung einer Ubuntu-VM mit System-Assigned Managed Identity (`--assign-identity`) und Extraktion der `principalId`
- **Granulares RBAC Scoping**: Zuweisung von `Reader`-Rechten auf Resource-Group-Ebene (`az role assignment create --role "Reader"`) sowie `Contributor`-Rechten gezielt auf VM-Ressourcenebene (`--role "Contributor"`)

### Cloud 7 – Governance & Monitoring

- **Resource Locks**: Schutz kritischer Ressourcen vor versehentlichem Löschen mittels `CanNotDelete`-Lock (`az lock create` / `az lock delete`)
- **Azure Policy & Compliance**: Einschränkung zulässiger Bereitstellungsregionen (`Allowed locations` auf `germanywestcentral`) via Policy Assignment (`az policy assignment create`) inkl. Deny-Verifikation
- **Azure Monitor & Alerting**: Abfrage von VM-Plattformmetriken (`az monitor metrics list`), Einrichtung einer E-Mail-Benachrichtigungsgruppe (`az monitor action-group create`) und einer schwellenwertbasierten CPU-Warnregel (`az monitor metrics alert create`)
- **Tagging & Cost Governance**: Vergabe von Metadaten-Tags (`CostCenter=000`) auf Resource-Group-Ebene (`az tag create`)
- **Auditing, Health & Advisor**: Auswertung von Control-Plane-Operationen im Activity Log (`az monitor activity-log list`), Abfrage des `Microsoft.ResourceHealth`-Status via `az rest` sowie Abruf von Optimierungsempfehlungen über Azure Advisor (`az advisor recommendation list`)

### Cloud 8 – FinOps & Cost Management

- **Kostenempfehlungen (Azure Advisor)**: Aktualisierung und gezielte Abfrage von Einsparpotenzialen der Kategorie `Cost` (`az advisor recommendation list --category Cost --refresh`)
- **Compute-Kostensteuerung & VM-Lifecycle**: Identifikation laufender VMs (`powerState=='VM running'`), Freigabe von Compute-Kapazitäten durch Deallokation (`az vm deallocate`) sowie Einrichtung eines automatischen täglichen Shutdowns (`az vm auto-shutdown --time 2100`)
- **Storage-Kostenoptimierung**: Aufspüren verwaister, nicht zugeordneter Managed Disks (`az disk list --query "[?managedBy==null]..."`)
- **Budgetierung**: Erstellung und Überprüfung eines monatlichen Kostenbudgets auf Resource-Group-Ebene (`az consumption budget create-with-rg` / `az consumption budget show`)
- **Cost Allocation & Tag-Governance**: Vergabe von Projekt- und Team-Tags (`az tag create --tags project=Banane team=Klasse0426`) sowie Durchsetzung eines Pflicht-Tags (`owner`) bei neuen Ressourcen mittels Azure Policy (`Require a tag on resources`) inkl. konformer Test-VM-Bereitstellung

### Cloud 9 – Security Assessment & Compliance (Prowler)

- **Auditing-Umgebung**: Isolierte Python-Umgebung (`python3 -m venv prowler-env`), Pip-Upgrade und Bereitstellung des Open-Source Security Tools Prowler (`pip install prowler`)
- **CLI-Authentifizierung & Scope**: Nahtlose Wiederverwendung aktiver Azure-CLI-Anmeldedaten (`az login`) und gezielte Subscription-Festlegung (`az account set --subscription`)
- **Automatisierte Security Audits**: Durchführung von Multi-Service-Sicherheitsprüfungen (`prowler azure --az-cli-auth`) zur Bewertung von Konfigurationsrisiken und Compliance (z. B. CIS Benchmark)
- **Multi-Format Reporting**: Generierung detaillierter Berichtsartefakte im interaktiven HTML-Format, tabellarischen CSV-Format und standardisierten JSON-OCSF-Format (`-M html csv json-ocsf`)
- **Lokale Report-Bereitstellung**: Lokaler Python-Webserver (`python3 -m http.server 8000`) zur bequemen Inspektion und Analyse des HTML-Sicherheits-Dashboards

### DevSecOps 4 – Secrets Management (Azure Key Vault, RBAC & Managed Identity)

- **Key Vault & RBAC Authorization**: Bereitstellung eines Azure Key Vaults mit nativer Entra ID RBAC-Autorisierung (`--enable-rbac-authorization true`) anstelle traditioneller Access Policies
- **Role Scoping & Privilegien**: Zuweisung administrativer Rechte (`Key Vault Secrets Officer`) auf Vault-Ebene an den Entra-Benutzer
- **Secret Lifecycle & Rotation**: Sichere Speicherung von Secrets (`az keyvault secret set`) inkl. Expiration Date, Versionierung bei Werteaktualisierung und tabellarische Versionsauflistung (`az keyvault secret list-versions`)
- **Zero-Secret Compute-Architektur**: Bereitstellung einer Ubuntu-VM mit System-Assigned Managed Identity (`az vm identity assign`)
- **Least-Privilege Datenebene**: Zuweisung der minimal erforderlichen Leserolle (`Key Vault Secrets User`) an die Identität der VM
- **IMDS & Remote Execution**: Remote-Installation der Azure CLI (`deb_install.sh`) via Azure VM Run-Command, tokenbasierte Authentifizierung (`az login --identity`) und schlüsselloser Secret-Abruf über den Azure Instance Metadata Service (IMDS)

### DevSecOps 7 – Container Security & Delivery (Azure Container Registry & Docker)

- **Container Registry & Provider**: Registrierung des Resource Providers (`Microsoft.ContainerRegistry`) und Erstellung einer privaten Azure Container Registry (`az acr create --sku Basic`)
- **CLI-gestützte Docker-Authentifizierung**: Nahtlose, tokenbasierte Anmeldung des Docker-Daemons via Entra ID (`az acr login`) ohne statische Secrets
- **Image Build & Tagging**: Lokales Erstellen des Container-Images via Dockerfile und Vergabe des FQDN-Tags (`<acr>.azurecr.io/<image>:latest`)
- **Registry Push & Repository-Inspektion**: Hochladen des Container-Images (`docker push`) und Verifizieren veröffentlichter Repositories (`az acr repository list -o table`)
- **Distribution Roundtrip & Execution**: Bereinigung lokaler Image-Caches (`docker rmi`), pull-basierter Download aus der ACR (`docker pull`) und Ausführung als Hintergrundcontainer mit Portweiterleitung (`docker run -d -p 5050:5050`)

### DevSecOps 8 – Infrastructure as Code (IaC & Terraform mit Azure)

- **Terraform CLI & Provider**: Einrichtung des offiziellen HashiCorp APT-Repositories und Installation der Terraform CLI
- **Headless Authentifizierung**: Konfiguration des `azurerm`-Providers über einen dedizierten Microsoft Entra ID Service Principal mit `Contributor`-Rolle und `ARM_*`-Umgebungsvariablen
- **Kern-Workflow**: Initialisierung (`terraform init`), automatisierte Code-Formatierung (`terraform fmt`), statische Validierung (`terraform validate`), differenzielle Ausführungspläne (`terraform plan`) und kontrollierte Anwendung (`terraform apply`)
- **State-Inspektion & Drift Reconciliation**: Analyse des Zustandsfiles (`terraform show`, `terraform state list`), Simulation manueller Ressourcenlöschung und vollautomatisierte Wiederherstellung des Sollzustands (Drift Detection)
- **Deklarative Infrastruktur-Evolution**: Inkrementelle Erweiterung bestehender HCL-Konfigurationen um Metadaten-Tags und Virtual Networks (`azurerm_virtual_network`)
- **Modernes Resource Importing (Terraform 1.5+)**: Deklarativer Import out-of-band erstellter Azure Virtual Machines über den `import`-Block inklusive automatisierter HCL-Codegenerierung (`-generate-config-out`)
- **Lifecycle & Cleanup**: Rückstandsfreie Deprovisionierung aller verwalteten Cloud-Ressourcen via `terraform destroy`

### DevSecOps 10 – Kubernetes & Container Orchestration (Minikube & Workloads)

- **Tooling & Lokaler Cluster**: Validierter Download von `kubectl` via SHA256-Checksumme, Bereitstellung von `minikube` und Start eines lokalen Clusters (`minikube start --driver=docker`)
- **Workload-Management**: Deklarative Erstellung von Deployments (`kubectl create deployment`) und Pod-Lifecycle-Inspektion (`kubectl get pods`, `kubectl describe pod`, `kubectl logs`, `kubectl exec -it`)
- **Resilienz & Self-Healing**: Validierung des Kubernetes Reconciliation Loops durch gezieltes Löschen von Pods (`kubectl delete pod`) und automatische Neuerstellung zur Erreichung des Desired States
- **Service-Exposition & Routing**: Exponieren von Workloads über NodePort-Services (`kubectl expose deployment --type="NodePort"`), Adressierung über Minikube-IP und statischen NodePort
- **Horizontale Skalierung & Load Balancing**: Hochskalieren von Replikaten (`kubectl scale --replicas=4`) und Verifikation des internen Service Round-Robin Load Balancings via HTTP (`curl`)
- **Zero-Downtime Rolling Updates & Rollbacks**: Nahtlose Aktualisierung von Container-Images (`kubectl set image`), Überwachung des Rollout-Status (`kubectl rollout status`), Fehlerbehandlung (`ImagePullBackOff`) und automatisiertes Rollback (`kubectl rollout undo`)
- **Lifecycle & Cleanup**: Rückstandsfreie Deprovisionierung aller Deployments und Services (`kubectl delete`)

### DevSecOps 11 – Kubernetes on Azure (AKS, ACR & Stateful Workloads)

- **Cluster-Provisionierung via IaC**: Deklarative Bereitstellung eines Azure Kubernetes Service (AKS) Clusters und Resource Group über Terraform (`azurerm_kubernetes_cluster`, System-Assigned Identity)
- **Cluster-Konnektivität**: Abruf von Cluster-Zugangsdaten und Kubeconfig-Kontext (`az aks get-credentials`)
- **Container Registry & Delivery**: Bereitstellung einer Azure Container Registry (`Basic`-SKU), tokenbasierte Docker-Authentifizierung (`az acr login`) sowie lokaler Image Build und Push
- **Schlüssellose ACR-Integration (RBAC)**: Anbindung der AKS-Kubelet-Identität (System-Assigned Managed Identity) an die ACR über die Rolle `AcrPull`, Validierung mittels `az aks check-acr` und nativer Cluster-Attach (`az aks update --attach-acr`)
- **Skalierte Web-Workload & Layer-4 Load Balancing**: Rollout eines redundanten Nginx-Deployments mit Resource Requests/Limits und automatischer Provisionierung eines Azure Standard Load Balancers über den Service-Typ `LoadBalancer`
- **Persistente Speicherarchitektur (StatefulSet & PVC)**: Implementierung einer Notizen-Webanwendung mittels Kubernetes `StatefulSet`, `ConfigMap`-Injektion (Python HTTP-Backend & HTML-Frontend) und dynamischer Bereitstellung einer Azure Managed Disk (Persistent Volume Claim via `volumeClaimTemplates`)
- **Lifecycle & Cleanup**: Rückstandsfreie Deprovisionierung der Cloud-Ressourcen via `terraform destroy` und `az group delete`

### DevSecOps 12 – Kubernetes Security (Attack Chain, RBAC Hardening, Node Escape & Kubescape)

- **OS Command Injection (RCE)**: Ausnutzung unvalidierter Benutzereingaben im Diagnosetool (`cluster-health-dashboard`) zur Remotebefehlsausführung im Container-Kontext
- **ServiceAccount Credential Theft**: Exfiltration des vom Kubelet automatisch gemounteten JWT-Bearer-Tokens und Namespaces (`/var/run/secrets/kubernetes.io/serviceaccount/`)
- **Interne API-Server-Reconnaissance**: Autorisierte Abfrage der internen Kubernetes-API (`https://kubernetes.default.svc`) direkt aus dem kompromittierten Web-Container
- **RBAC-Misconfiguration & Secret Extraction**: Aufdeckung übermäßiger Berechtigungen (`ClusterRole`) mittels `kubectl auth can-i` und Auslesen geschützter Produktionsdaten (`db-credentials`) aus dem isolierten Namespace `database`
- **RBAC-Remediation (Least Privilege)**: Härtung des Zugriffskonstrukts durch Entfernen der globalen `ClusterRole` und Beschränkung auf eine namespaced `Role` (`fixed-role.yaml`)
- **Privilege Escalation & Container Escape**: Missbrauch von `create pods`-Rechten zur Erstellung eines privilegierten Containers (`privileged: true`) mit Host-Mount (`hostPath: /`) und Nachweis des Durchgriffs auf das Root-Dateisystem des Kubernetes-Knotens via `minikube ssh`
- **Cloud Metadata Protection (IMDS)**: Demonstration von SSRF- und Metadaten-Exfiltrationsrisiken gegen den simulierten Azure Instance Metadata Service (`mock-azure-imds`)
- **Shift-Left Security & Static Analysis**: Installation von `kubescape` und statische Auditierung aller Kubernetes-Manifeste nach dem NSA/CISA Kubernetes Hardening Framework
- **Netzwerksegmentierung & Pod Security**: Standalone-Demos zur Durchsetzung von Zero-Trust via Calico NetworkPolicies (Default-Deny & Scoped-Allow) sowie Pod Security Standards (Restricted vs. Privileged)
- **Lifecycle & Cleanup**: Rückstandsfreie Cluster-Bereinigung via `./teardown.sh`

### DevSecOps 13 – Kubernetes Goat (Helm, Minikube & 22 Security-Szenarien)

- **Tooling & Cluster-Setup**: Sichere Installation von **Helm v3** (mit GPG-Fingerprint-Verifikation des Buildkite-APT-Keys), `kubectl` sowie `minikube start --driver=docker`
- **Lab-Provisioning & Zugriff**: Klonen von `madhuakula/kubernetes-goat`, Rollout aller verwundbaren Workloads (`setup-kubernetes-goat.sh`), Port-Forwarding (`1230`–`1236` via `access-kubernetes-goat.sh`) und Bereinigung (`teardown-kubernetes-goat.sh`)
- **Secrets & Supply Chain**: Auslesen exponierter `.git`-Repositories (`git-dumper`, `TruffleHog`), offener Private Container Registries (`/v2/_catalog`), versteckter Docker-Image-Layer (`docker history`, `dfimage`, `layer.tar`) sowie geleakter `ENV`-Variablen
- **Container Escape & Netzwerk**: Exploitation gemounteter `containerd.sock`-Sockets (`crictl`), privilegierter `hostPath`-Mounts (`chroot`), SSRF auf interne Dienste (`metadata-db`), offener `NodePort`s sowie Namespace-Bypassing (`zmap`, `redis-cli`) und Isolation via `NetworkPolicy`
- **RBAC, Auditing & Runtime Defense**: Analyse überprivilegierter ServiceAccounts, CIS Benchmarks (`docker-bench-security`, `kube-bench`), Cluster-Auditing (`kubeaudit`, `popeye`), eBPF/Kernel-Runtime-Monitoring (`Falco`, `Cilium Tetragon`) und Policy Enforcement (`Kyverno`)

---

## Hinweise zur Nutzung

- **Umgebungsvariablen**: Vor dem manuellen Ausführen einzelner Skripte sollten stets die entsprechenden Variablen (`00_env_variables.sh` bzw. zu Beginn der Session) geladen werden:

  ```bash
  source single_cmd_collection/cloud3/00_env_variables.sh
  ```
  
- **Prerequisites**:
  - **Azure CLI (`az`)**: Installiert und via `az login` authentifiziert
  - **SSH-Schlüssel**: Aktuelle SSH-Keys im Standardpfad (`~/.ssh/id_rsa` bzw. `~/.ssh/id_ed25519`)
  - **Docker**: Lokale Docker-Engine / Docker Desktop gestartet und betriebsbereit (für ACR Container-Workflows & Minikube Docker-Driver)
  - **Terraform**: HashiCorp Terraform CLI (Version >= 1.5 für deklarative `import`-Blöcke, DevSecOps 8)
  - **Kubernetes Tooling**:
    - `kubectl`: Kubernetes Command-Line Tool zur Cluster- und Workload-Verwaltung
    - `minikube`: Lokale Single-Node-Kubernetes-Cluster-Umgebung (DevSecOps 10, DevSecOps 12, DevSecOps 13)
    - `helm`: Kubernetes Package Manager (Helm v3, DevSecOps 13)
    - `kubescape`: Kubernetes Security & Compliance Scanner (DevSecOps 12)
