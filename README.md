# Cybersteps Azure CLI Labs

Eine minimalistische Wissens- und Befehlsdatenbank für die **Azure Sessions** auf Cybersteps unter Nutzung der **Azure CLI (`az`)** auf einer Linux-Distribution.

Jede Session enthält modulare Einzelbefehle inklusive ausführlicher Erklärungen zu den Parametern.

---

## Sessions

| Session | Thema | Einzelbefehle |
|---|---|---|
| **Cloud 3** | Virtual Networking (VNets, Subnetze, VMs, Bastion, Run-Command) | [`single_cmd_collection/cloud3/`](./single_cmd_collection/cloud3/) |
| **Cloud 5** | Storage & Databases (Storage Accounts, Blobs, SAS, Access Tiers) | [`single_cmd_collection/cloud5/`](./single_cmd_collection/cloud5/) |
| **Cloud 6** | Load Balancing & WAF (Standard LB, App Gateway, OWASP WAF, Network Watcher) | [`single_cmd_collection/cloud6/`](./single_cmd_collection/cloud6/) |

---

## Repository-Struktur

```text
.
├── AGENTS.md                  # Verhaltensregeln für AI-Agents (Ausführungsverbot)
├── README.md                  # Zentrale Übersicht (dieses Dokument)
└── single_cmd_collection/     # Modulare Befehlssammlung nach Sessions unterteilt
    ├── README.md              # Übersicht über alle Sessions in der Sammlung
    ├── cloud3/                # Einzelbefehle für Cloud 3
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

### Cloud 5 – Storage & Databases
- **Storage Account & Container**: Bereitstellung von Blob Storage und privaten Containern
- **Blob Operations**: Upload, Download, Listung und Löschen von Blobs
- **Lifecycle & Access Tiers**: Dynamischer Wechsel zwischen `Hot`- und `Cool`-Tiers
- **Sicherheits- & Zugriffssteuerung**: Generierung zeitlich beschränkter SAS-Tokens (`az storage blob generate-sas`), sowie Verwaltung des anonymen Public-Blob-Zugriffs auf Account- und Container-Ebene

### Cloud 6 – Load Balancing & Web Application Firewall (WAF)
- **Layer-4 Load Balancing**: Bereitstellung eines `Standard` Azure Load Balancers inkl. Frontend-IP, Backend-Pool, TCP Health Probe und HTTP-Verteilungsregel (`az network lb`)
- **Automatisiertes Backend-Provisioning**: Schleifenbasierte Erstellung redundanter Web-VMs (`web1`, `web2`), Nginx-Rollout via `run-command`, NIC-Pool-Registrierung und NSG-Freigaben
- **High Availability & Failover**: Simulation eines Knotenausfalls (`az vm stop` / `az vm start`)
- **Layer-7 Application Gateway & WAF**: Bereitstellung eines Application Gateways (`WAF_v2`) mit vorgeschalteter `OWASP 3.2` WAF-Policy im `Prevention`-Modus
- **Netzwerkdiagnose**: Überprüfung effektiver NSG-Sicherheitsregeln mittels Azure Network Watcher (`az network watcher test-ip-flow`)

---

## Hinweise zur Nutzung

- **Umgebungsvariablen**: Vor dem manuellen Ausführen einzelner Skripte sollten stets die entsprechenden Variablen (`00_env_variables.sh` bzw. zu Beginn der Session) geladen werden:
  ```bash
  source single_cmd_collection/cloud3/00_env_variables.sh
  ```
  
- **Prerequisites**:
  - Azure CLI (`az`) installiert und via `az login` authentifiziert
  - Aktuelle SSH-Keys im Standardpfad (`~/.ssh/id_rsa` bzw. `~/.ssh/id_ed25519`)
