#!/usr/bin/env bash
# ==============================================================================
# 9. POSTGRESQL FLEXIBLE SERVER ERSTELLEN
# ==============================================================================
# Erstellt eine PostgreSQL Flexible Server Instanz (Version 16)
# Parameter:
#   --resource-group $RG        : Ziel-Resource-Group
#   --name $PG_NAME             : Eindeutiger Name des Datenbankservers
#   --location westeurope       : Azure-Region (hier: West Europe / Amsterdam)
#   --admin-user $PG_ADMIN      : Administrator-Benutzername
#   --admin-password "$PG_PASS" : Sicheres Kennwort
#   --sku-name Standard_D2s_v3  : VM-Größe / Rechenleistung (2 vCPUs, 8 GB RAM)
#   --tier GeneralPurpose       : Leistungsstufe (General Purpose)
#   --version 16                : PostgreSQL Major-Version 16
#   --storage-size 32           : Speichergröße in GiB
#   --public-access None        : Kein öffentlicher Zugriff (vollständig isoliert)
#   --yes                       : Bestätigt automatisch eventuelle Prompts

az postgres flexible-server create \
  --resource-group $RG \
  --name $PG_NAME \
  --location westeurope \
  --admin-user $PG_ADMIN \
  --admin-password "$PG_PASS" \
  --sku-name Standard_D2s_v3 \
  --tier GeneralPurpose \
  --version 16 \
  --storage-size 32 \
  --public-access None \
  --yes
