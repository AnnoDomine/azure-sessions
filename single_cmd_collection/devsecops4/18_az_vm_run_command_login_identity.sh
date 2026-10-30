#!/usr/bin/env bash
# ==============================================================================
# 16. AZURE CLI VIA MANAGED IDENTITY AUF DER VM AUTHENTIFIZIEREN
# ==============================================================================
# Führt 'az login --identity' remote auf der VM aus.
# Die Azure CLI authentifiziert sich dabei über den Azure Instance Metadata Service
# (IMDS) vollautomatisch über die System-Assigned Managed Identity der VM,
# ohne dass Passwörter, Client Secrets oder Zertifikate hinterlegt werden müssen.
# Parameter:
#   --resource-group "$RG"       : Resource Group der VM
#   --name "$VM"                 : Name der Ziel-VM
#   --command-id RunShellScript  : Ausführungsmodul
#   --scripts "az login --identity" : Authentifizierungsbefehl via Managed Identity
#   -o table                     : Tabellarische Ausgabe der Anmeldeinformationen

az vm run-command invoke \
  --resource-group "$RG" \
  --name "$VM" \
  --command-id RunShellScript \
  --scripts "az login --identity" \
  -o table
