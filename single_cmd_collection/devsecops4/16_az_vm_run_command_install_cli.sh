#!/usr/bin/env bash
# ==============================================================================
# 14. AZURE CLI AUF DER VM INSTALLIEREN (VIA RUN-COMMAND)
# ==============================================================================
# Führt das offizielle Installationsskript der Azure CLI direkt auf der VM
# über den Azure VM Guest Agenten aus (kein SSH-Port von außen erforderlich).
# Parameter:
#   --resource-group "$RG"       : Resource Group der VM
#   --name "$VM"                 : Name der Ziel-VM
#   --command-id RunShellScript  : Ausführungsmodul für Bash-Skripte auf Linux
#   --scripts "..."              : Befehl zur Installation des Debian/Ubuntu-CLI-Pakets

az vm run-command invoke \
  --resource-group "$RG" \
  --name "$VM" \
  --command-id RunShellScript \
  --scripts "curl -fsSL 'https://azurecliprod.blob.core.windows.net/\$root/deb_install.sh' | bash"
