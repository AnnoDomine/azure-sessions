## Übersicht der Dateien

Cloud 3:

| Datei | Beschreibung |
|---|---|
| [`00_env_variables.sh`](./00_env_variables.sh) | Alle 3 Umgebungsvariablen (`RG`, `REGION`, `VNET`) gemeinsam |
| [`01_export_rg.sh`](./01_export_rg.sh) | `export RG="cloud3-lab-rg"` |
| [`02_export_region.sh`](./02_export_region.sh) | `export REGION="germanywestcentral"` |
| [`03_export_vnet.sh`](./03_export_vnet.sh) | `export VNET="cloud3-vnet"` |
| [`04_az_group_create.sh`](./04_az_group_create.sh) | Erstellt die Azure Resource Group |
| [`05_az_network_vnet_create.sh`](./05_az_network_vnet_create.sh) | Erstellt das VNet und das erste Subnetz (`web-subnet`) |
| [`06_az_network_vnet_subnet_create_app.sh`](./06_az_network_vnet_subnet_create_app.sh) | Erstellt das Applikations-Subnetz (`app-subnet`) |
| [`07_az_network_vnet_subnet_create_db.sh`](./07_az_network_vnet_subnet_create_db.sh) | Erstellt das Datenbank-Subnetz (`db-subnet`) |
| [`08_az_vm_create_webvm.sh`](./08_az_vm_create_webvm.sh) | Erstellt die Web-VM im `web-subnet` |
| [`09_az_vm_create_appvm.sh`](./09_az_vm_create_appvm.sh) | Erstellt die App-VM im `app-subnet` (im Original `--name webvm`) |
| [`10_az_vm_create_dbvm.sh`](./10_az_vm_create_dbvm.sh) | Erstellt die DB-VM im `db-subnet` (im Original `--name webvm`) |
| [`11_az_vm_run_command_invoke.sh`](./11_az_vm_run_command_invoke.sh) | Führt Nginx-Installation via Azure VM Run-Command aus |
| [`12_az_network_vnet_subnet_create_bastion.sh`](./12_az_network_vnet_subnet_create_bastion.sh) | Erstellt das erforderliche `AzureBastionSubnet` |
| [`13_az_network_public_ip_create.sh`](./13_az_network_public_ip_create.sh) | Erstellt die Standard Public-IP für Azure Bastion |
| [`14_az_network_bastion_create.sh`](./14_az_network_bastion_create.sh) | Erstellt den Azure Bastion Host mit Tunneling |
| [`15_az_extension_add_ssh.sh`](./15_az_extension_add_ssh.sh) | Installiert die SSH-Erweiterung für die Azure CLI |
| [`16_az_vm_show_id.sh`](./16_az_vm_show_id.sh) | Hilfsabfrage: Ermittelt die Ressourcen-ID der VM `webvm` |
| [`17_az_network_bastion_ssh.sh`](./17_az_network_bastion_ssh.sh) | Baut eine SSH-Sitzung via Bastion auf |
