#!/usr/bin/env bash
# ==============================================================================
# 15. AZURE CLI INSTALLATION AUF DER VM ÜBERPRÜFEN
# ==============================================================================
# Führt 'az --version' auf der VM aus, um zu überprüfen, ob die Azure CLI
# erfolgreich installiert wurde.
# Parameter:
#   --resource-group "$RG"       : Resource Group der VM
#   --name "$VM"                 : Name der Ziel-VM
#   --command-id RunShellScript  : Ausführungsmodul
#   --scripts "az --version"     : Auszuführender Versionsprüfbefehl
#   -o table                     : Tabellarische Ausgabe

az vm run-command invoke \
  --resource-group "$RG" \
  --name "$VM" \
  --command-id RunShellScript \
  --scripts "az --version" \
  -o table
