#!/usr/bin/env bash
# ==============================================================================
# 12. VERBINDUNG VIA PSQL TESTEN (VERSIONSPRÜFUNG)
# ==============================================================================
# Verbindet sich per SSL mit der PostgreSQL-Datenbank und gibt die Version aus
# Parameter:
#   PGSSLMODE=require : Erzwingt TLS/SSL-Verschlüsselung (Azure Vorgabe)
#   psql "..."        : Verbindungs-String für PostgreSQL
#   -c "..."          : Führt ein SQL-Statement aus und beendet die Sitzung

export PGSSLMODE=require

psql "host=$PG_HOST port=5432 dbname=postgres user=$PG_ADMIN password=$PG_PASS" \
  -c "SELECT version();"
