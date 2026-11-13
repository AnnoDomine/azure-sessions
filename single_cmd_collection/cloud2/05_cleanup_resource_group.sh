#!/usr/bin/env bash
# ==============================================================================
# 5. RESSOURCENGRUPPE LÖSCHEN (CLEANUP)
# ==============================================================================
# Entfernt die VM samt OS-Disk, NIC, Public IP, VNet und NSG vollständig.

az group delete \
  --name "$RG" \
  --yes \
  --no-wait
