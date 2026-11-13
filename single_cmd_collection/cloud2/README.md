# Cloud 2: Virtual Machines & Compute (Azure CLI Workflow)

Themenschwerpunkte dieser Session sind die **Compute-Modelle (IaaS, PaaS, Serverless)**, die **Ressourcen-Anatomie einer Azure Virtual Machine**, **SKU- und Region-Entscheidungen** sowie die Steuerung der **Network Security Group (NSG)** als zustandsbehaftete Cloud-Firewall komplett über die **Azure CLI (`az`)** auf Ubuntu.

---

## Übersicht der Skripte

| Datei | Beschreibung |
| --- | --- |
| [`00_env_variables.sh`](./00_env_variables.sh) | Zentrale Variablen (`RG`, `LOCATION`, `VM_NAME`, `VM_IMAGE`, `VM_SIZE`, `ADMIN_USER`) |
| [`01_create_resource_group.sh`](./01_create_resource_group.sh) | Resource Group erstellen (`az group create`) |
| [`02_create_vm_and_export_ip.sh`](./02_create_vm_and_export_ip.sh) | Ubuntu-VM erstellen und `PUBLIC_IP` direkt per `--query` in Env-Var speichern |
| [`03_ssh_connect_vm.sh`](./03_ssh_connect_vm.sh) | Dynamisches Auslesen von `PUBLIC_IP` (`az vm show -d`) und SSH-Verbindung |
| [`04_delete_nsg_ssh_rule.sh`](./04_delete_nsg_ssh_rule.sh) | NSG-Name & Port-22-Regel per JMESPath ermitteln und löschen (`az network nsg rule delete`) |
| [`05_cleanup_resource_group.sh`](./05_cleanup_resource_group.sh) | Vollständiges Entfernen der Resource Group (`az group delete --yes --no-wait`) |

---

## Technische Insights & Konzepte

### 1. Compute-Modelle & Verantwortungsabgrenzung
- **IaaS (Virtual Machines)**: Volle Kontrolle über Kernel, OS-Patches, Firewall und Laufzeitumgebung – ideal für Legacy-Workloads oder spezielle Treiber/Systemkonfigurationen.
- **PaaS (App Service)**: Microsoft verwaltet OS und Runtime; Fokus auf App-Code und Daten.
- **Serverless (Functions)**: Ereignisgesteuerte Ausführung pro Aufruf; keine Infrastrukturverwaltung.

### 2. VM-Anatomie & SKU-Auswahl
- `az vm create` provisioniert nicht nur die VM selbst, sondern ein ganzes **Ressourcenbündel**:
  1. **Virtual Machine** (Compute-Definition)
  2. **OS Managed Disk** (Standard/Premium SSD)
  3. **Virtual Network & Subnet**
  4. **Network Interface (NIC)**
  5. **Public IP Address**
  6. **Network Security Group (NSG)** mit automatischer Inbound-Regel für Port `22` (SSH)
- **Burstable B-Series (z. B. `Standard_B1s`)**: Arbeiten mit einem **CPU-Credit-Modell** – geringe Basisleistung zu niedrigen Kosten, jedoch kurzzeitige Lastspitzen (*Bursts*) möglich; optimal für Dev/Test-Server, ungeeignet für dauerhaft ausgelastete Datenbanken oder KI-Training.
- **Governance-konforme SKUs**: Bei restriktiven Azure Policies stehen typischerweise kostenkontrollierte Größen wie `standard_b1s`, `standard_b1ms`, `standard_b2s`, `standard_b2ms`, `standard_b1ls` sowie `standard_d2s_v5` / `v6` / `v7` zur Verfügung.

### 3. Stateful Firewalling in der Praxis (`04_delete_nsg_ssh_rule.sh`)
- Die Azure NSG arbeitet **zustandsbehaftet (stateful)** auf Basis einer Flow-Tabelle (Connection Tracking).
- **Effekt beim Löschen der `AllowSSH`-Regel**:
  - **Neue** TCP-SYN-Pakete auf Port `22` werden verworfen – ein erneuter `ssh`-Login schlägt per Timeout fehl.
  - Eine **bereits bestehende** SSH-Verbindung bleibt zunächst aktiv, bis sie getrennt oder das Flow-Timeout erreicht wird.
- **Sicherheits-Best-Practice**: Für produktive Umgebungen Port `22` niemals dauerhaft für `*` öffnen, sondern **Azure Bastion** (Session Cloud 3) oder zeitlich begrenzte Just-in-Time-(JIT)-Freigaben nutzen.
