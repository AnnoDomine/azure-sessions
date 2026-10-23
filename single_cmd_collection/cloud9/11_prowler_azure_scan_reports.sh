#!/usr/bin/env bash
# ==============================================================================
# 12. PROWLER AZURE AUDIT MIT DEDIZIERTEN BERICHTSFORMATEN
# ==============================================================================
# Führt einen detaillierten Prowler Security Scan gegen die angegebene Azure
# Subscription durch und exportiert die Prüfergebnisse in mehrere strukturierte
# Dateiformate zur weiteren Auswertung und Archivierung.
# Parameter:
#   azure               : Wählt den Provider Microsoft Azure aus
#   --az-cli-auth       : Nutzt die aktive Azure CLI Sitzung für die Berechtigungen
#   -M / --output-modes : Definiert die Exportformate:
#                           - html: Interaktives Dashboard für den Browser
#                           - csv: Tabellarische Daten für Excel/Calc
#                           - json-ocsf: Standardisiertes Security-Format (Open Cybersecurity Schema Framework)
#   --subscription-ids  : Beschränkt den Scan auf die spezifische Subscription-ID

prowler azure \
  --az-cli-auth \
  -M html csv json-ocsf \
  --subscription-ids "$SUBSCRIPTION_ID"
