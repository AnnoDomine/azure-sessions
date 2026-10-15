#!/usr/bin/env bash
# ==============================================================================
# 9. AZURE RESOURCE PROVIDER REGISTRIEREN (FALLBACK BEI PERMISSION ERROR)
# ==============================================================================
# Registriert den Resource Provider für PostgreSQL im Azure-Abonnement
# Parameter:
#   --namespace Microsoft.DBforPostgreSQL : Name des Resource Providers
#   --wait                                : Wartet, bis die Registrierung abgeschlossen ist

az provider register \
  --namespace Microsoft.DBforPostgreSQL \
  --wait
