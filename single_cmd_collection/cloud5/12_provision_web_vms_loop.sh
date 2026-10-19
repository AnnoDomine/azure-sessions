#!/usr/bin/env bash
# ==============================================================================
# 8. BACKEND-WEB-VMs AUTOMATISIERT BEREITSTELLEN & IN LOAD BALANCER EINBINDEN
# ==============================================================================
# Schleife über zwei Instanzen (web1, web2):
#   1. Erstellt die VM im Subnetz 'backend' zunächst ohne Public IP
#   2. Erstellt eine dedizierte statische Standard Public IP (web1-pip, web2-pip)
#   3. Weist die Public IP der Netzwerkschnittstelle (NIC) der jeweiligen VM zu
#   4. Installiert Nginx via Run-Command und hinterlegt eine individuelle Startseite ('Server 1' / 'Server 2')
#   5. Prüft den Systemd-Status von Nginx sowie die lokale Erreichbarkeit via curl
#   6. Ermittelt dynamisch NIC-Name und IP-Konfigurationsname und fügt die VM zum Load-Balancer-Pool hinzu
#   7. Öffnet Port 80 (Inbound HTTP) in der Network Security Group (NSG) der jeweiligen VM

for n in 1 2; do
  echo "Create VM $n"
  az vm create \
    --resource-group $RG \
    --name web$n \
    --image Ubuntu2204 \
    --size Standard_D2s_v6 \
    --storage-sku StandardSSD_LRS \
    --vnet-name $VNET \
    --subnet backend \
    --public-ip-address "" \
    --admin-username azureuser \
    --generate-ssh-keys

  echo "Create IP for VM web$n"
  az network public-ip create \
    --resource-group $RG \
    --name web${n}-pip \
    --sku Standard \
    --allocation-method Static

  echo "Update IP for VM web$n"
  az network nic ip-config update \
    --resource-group $RG \
    --nic-name "web${n}VMNic" \
    --name "ipconfigweb${n}" \
    --public-ip-address "web${n}-pip"

  echo "Install nginx on VM web$n"
  az vm run-command invoke \
    --resource-group $RG \
    --name web$n \
    --command-id RunShellScript \
    --scripts "sudo apt-get update && sudo apt-get install -y nginx && echo 'Server $n' | sudo tee /var/www/html/index.html"

  echo "Activate nginx on VM web$n"
  az vm run-command invoke \
    --resource-group $RG \
    --name "web$n" \
    --command-id RunShellScript \
    --scripts "systemctl is-active nginx" \
    --query "value[0].message" -o tsv

  echo "Check localhost reachable on VM web$n"
  az vm run-command invoke \
    -g $RG \
    -n web$n \
    --command-id RunShellScript \
    --scripts "curl -s http://localhost"

  NIC=$(az vm show -g $RG -n web$n --query "networkProfile.networkInterfaces[0].id" -o tsv)
  NICNAME=$(basename $NIC)
  IPCFG=$(az network nic show -g $RG -n $NICNAME --query "ipConfigurations[0].name" -o tsv)

  echo "Add web$n to $LB pool"
  az network nic ip-config address-pool add \
    --resource-group $RG \
    --nic-name $NICNAME \
    --ip-config-name $IPCFG \
    --lb-name $LB \
    --address-pool pool

  echo "Update Firewall for web$n"
  az network nsg rule create \
    -g $RG \
    --nsg-name web${n}NSG \
    -n allow-http \
    --priority 100 \
    --direction Inbound \
    --access Allow \
    --protocol Tcp \
    --source-address-prefixes '*' \
    --destination-port-ranges 80
done
