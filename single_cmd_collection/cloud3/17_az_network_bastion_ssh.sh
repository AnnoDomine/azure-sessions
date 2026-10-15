#!/usr/bin/env bash
# ==============================================================================
# 7. SSH-VERBINDUNG VIA BASTION (NATIVE CLIENT TUNNELING)
# ==============================================================================
# Baut eine sichere SSH-Sitzung über Azure Bastion auf die private VM auf
# Parameter:
#   --resource-group $RG      : Ziel-Resource-Group
#   --name cloud3-bastion     : Name des Bastion-Dienstes
#   --target-resource-id ...  : Ressourcen-ID der Ziel-VM (via Subshell az vm show)
#   --auth-type ssh-key       : Authentifizierungsart via SSH-Key
#   --username azureuser      : Administrator-Benutzername
#   --ssh-key ~/.ssh/id_rsa   : Pfad zum privaten SSH-Schlüssel

az network bastion ssh \
  --resource-group $RG \
  --name cloud3-bastion \
  --target-resource-id $(az vm show -g $RG -n webvm --query id -o tsv) \
  --auth-type ssh-key \
  --username azureuser \
  --ssh-key ~/.ssh/id_rsa
