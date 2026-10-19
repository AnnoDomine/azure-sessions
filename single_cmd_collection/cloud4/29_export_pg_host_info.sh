#!/usr/bin/env bash
# ==============================================================================
# 11. POSTGRESQL HOST-ADRESSE ERMITTELN & VERBINDUNGSDATEN ANZEIGEN
# ==============================================================================
# Fragt den FQDN des PostgreSQL-Servers ab und gibt alle Verbindungsdaten aus
# Parameter:
#   --query "fullyQualifiedDomainName" : Liest den DNS-Hostnamen des Servers aus
#   -o tsv                             : Reiner Textstring

export PG_HOST=$(az postgres flexible-server show \
  --resource-group $RG \
  --name $PG_NAME \
  --query "fullyQualifiedDomainName" \
  -o tsv)

echo "Host:     $PG_HOST"
echo "Port:     5432"
echo "Database: postgres"
echo "Username: $PG_ADMIN"
echo "Password: (the value of \$PG_PASS you set above)"
