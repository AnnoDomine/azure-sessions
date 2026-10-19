#!/usr/bin/env bash
# ==============================================================================
# 11. POSTGRESQL SERVERSTATUS ANZEIGEN
# ==============================================================================
# Zeigt Servername, Betriebszustand, Version und den vollqualifizierten Hostnamen (FQDN) an
# Parameter:
#   --resource-group $RG : Ziel-Resource-Group
#   --name $PG_NAME      : Name des Datenbankservers
#   --query "{...}"      : Formatiert die Ausgabe als tabellarische Übersicht
#   -o table             : Tabellenausgabe

az postgres flexible-server show \
  --resource-group $RG \
  --name $PG_NAME \
  --query "{name:name, state:state, version:version, fqdn:fullyQualifiedDomainName}" \
  -o table
