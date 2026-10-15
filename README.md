# Cybersteps Azure CLI Labs

Eine minimalistische Wissens- und Befehlsdatenbank für die **Azure Sessions** auf Cybersteps unter Nutzung der **Azure CLI (`az`)** auf einer Linux-Distribution.

Jede Session enthält modulare Einzelbefehle inklusive ausführlicher Erklärungen zu den Parametern sowie das zusammenhängende Gesamtskript.

---

## Sessions

| Session | Thema | Gesamtskript | Einzelbefehle |
|---|---|---|---|
| **Cloud 3** | Virtual Networking (VNets, Subnetze, VMs, Bastion, Run-Command) | [`cloud3.sh`](./cloud3.sh) | [`single_cmd_collection/cloud3/`](./single_cmd_collection/cloud3/) |
| **Cloud 5** | Storage & Databases (Storage Accounts, Blobs, SAS, Access Tiers) | [`cloud5.sh`](./cloud5.sh) | [`single_cmd_collection/cloud5/`](./single_cmd_collection/cloud5/) |

---

## Repository-Struktur

```text
.
├── AGENTS.md                  # Verhaltensregeln für AI-Agents (Ausführungsverbot)
├── README.md                  # Zentrale Übersicht (dieses Dokument)
├── cloud3.sh                  # Gesamtskript für Session 3: Virtual Networking
├── cloud5.sh                  # Gesamtskript für Session 5: Storage & Databases
└── single_cmd_collection/     # Modulare Befehlssammlung nach Sessions unterteilt
    ├── README.md              # Übersicht über alle Sessions in der Sammlung
    ├── cloud3/                # Einzelbefehle für Cloud 3
    │   ├── 00_env_variables.sh
    │   ├── 01_export_rg.sh
    │   ├── ...
    │   ├── 17_az_network_bastion_ssh.sh
    │   └── README.md
    └── cloud5/                # Einzelbefehle für Cloud 5
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

---

## Hinweise zur Nutzung

- **Umgebungsvariablen**: Vor dem manuellen Ausführen einzelner Skripte sollten stets die entsprechenden Variablen (`00_env_variables.sh` bzw. zu Beginn der Session) geladen werden:
  ```bash
  source single_cmd_collection/cloud3/00_env_variables.sh
  ```
- **Prerequisites**:
  - Azure CLI (`az`) installiert und via `az login` authentifiziert
  - Aktuelle SSH-Keys im Standardpfad (`~/.ssh/id_rsa` bzw. `~/.ssh/id_ed25519`)
