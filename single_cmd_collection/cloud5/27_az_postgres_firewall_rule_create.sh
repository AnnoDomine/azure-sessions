#!/usr/bin/env bash
# ==============================================================================
# 10. FIREWALL-REGEL FÜR POSTGRESQL ERSTELLEN
# ==============================================================================
# Erlaubt Zugriff von der eigenen IP-Adresse auf den Datenbankserver
# Parameter:
#   --resource-group $RG      : Ziel-Resource-Group
#   --name $PG_NAME           : Name des PostgreSQL Flexible Servers
#   --rule-name allow-my-ip   : Name der Firewall-Regel
#   --start-ip-address $MY_IP : Start der erlaubten IP-Range (hier: Einzel-IP)
#   --end-ip-address $MY_IP   : Ende der erlaubten IP-Range

az postgres flexible-server firewall-rule create \
  --resource-group $RG \
  --name $PG_NAME \
  --rule-name allow-my-ip \
  --start-ip-address $MY_IP \
  --end-ip-address $MY_IP
