#!/usr/bin/env bash
# ==============================================================================
# 17. SECRET AUS DEM KEY VAULT ABFRAGEN
# ==============================================================================
# Fragt den aktuellen Klartextwert des Secrets 'db-password' aus dem Key Vault ab.
# Hinweis zur Ausführung im Lab:
#   1. Innerhalb der VM (nach 'ssh azureuser@<VM_IP>' oder via run-command):
#      Die VM greift dank Managed Identity und der Rolle "Key Vault Secrets User"
#      berechtigt auf den Vault zu.
#   2. Auf dem Administrations-Rechner:
#      Der angemeldete Benutzer liest das Secret über die Rolle "Key Vault Secrets Officer".
# Parameter:
#   --vault-name "$KV_NAME" : Name des Key Vaults
#   --name "db-password"    : Name des Secrets
#   --query value           : Extrahiert ausschließlich das Secret-Feld 'value'
#   --output tsv            : Tab-Separated Values (Klartext ohne Quotes)

az keyvault secret show \
  --vault-name "$KV_NAME" \
  --name "db-password" \
  --query value \
  --output tsv
