#!/usr/bin/env bash
# ==============================================================================
# 9. SECRET-VERSIONEN TABELLARISCH AUFLISTEN
# ==============================================================================
# Listet alle existierenden Versionen des Secrets 'db-password' auf, inklusive
# Versions-ID, Erstellungszeitpunkt und Status.
# Parameter:
#   --vault-name "$KV_NAME" : Name des Key Vaults
#   --name "db-password"    : Name des abzufragenden Secrets
#   --output table          : Tabellarische Ausgabeformatierung

az keyvault secret list-versions \
  --vault-name "$KV_NAME" \
  --name "db-password" \
  --output table
