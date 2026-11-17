#!/usr/bin/env bash
# ==============================================================================
# 1. RESOURCE PROVIDER REGISTRIEREN & RESOURCE GROUP ERSTELLEN
# ==============================================================================
# Registriert den Resource Provider "Microsoft.CognitiveServices" in der
# aktuellen Azure-Subscription und legt anschließend die Resource Group an.
#
# Erklärung der Parameter:
# --namespace Microsoft.CognitiveServices : Provider für Azure AI / Cognitive Services
# --wait                                  : Wartet synchron, bis die Registrierung
#                                           vollständig abgeschlossen ist
# -n / --name                             : Name der Resource Group ($RG)
# -l / --location                         : Azure-Region ($LOC, z. B. germanywestcentral)

az provider register \
  --namespace Microsoft.CognitiveServices \
  --wait

az group create -n "$RG" -l "$LOC"
