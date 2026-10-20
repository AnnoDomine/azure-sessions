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

---

## Repository-Struktur

```text
.
├── AGENTS.md                  # Verhaltensregeln für AI-Agents (Ausführungsverbot)
├── README.md                  # Zentrale Übersicht (dieses Dokument)
└── single_cmd_collection/     # Modulare Befehlssammlung nach Sessions unterteilt
    ├── README.md              # Übersicht über alle Sessions in der Sammlung
    ├── cloud3/                # Einzelbefehle für Cloud 3
    ├── cloud4/                # Einzelbefehle für Cloud 4
    ├── cloud5/                # Einzelbefehle für Cloud 5
    └── cloud6/                # Einzelbefehle für Cloud 6
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

---

## Hinweise zur Nutzung

- **Umgebungsvariablen**: Vor dem manuellen Ausführen einzelner Skripte sollten stets die entsprechenden Variablen (`00_env_variables.sh` bzw. zu Beginn der Session) geladen werden:

  ```bash
  source single_cmd_collection/cloud3/00_env_variables.sh
  ```
  
- **Prerequisites**:
  - Azure CLI (`az`) installiert und via `az login` authentifiziert
  - Aktuelle SSH-Keys im Standardpfad (`~/.ssh/id_rsa` bzw. `~/.ssh/id_ed25519`)
