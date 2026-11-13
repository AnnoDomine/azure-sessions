#!/usr/bin/env bash
# ==============================================================================
# 5. RESSOURCENGRUPPE & ALLE ENTHALTENEN RESSOURCEN LÖSCHEN (CLEANUP)
# ==============================================================================
# Entfernt die gesamte Resource Group asynchron (--no-wait) ohne Rückfrage
# (--yes), um laufende Kosten und verwaiste Ressourcen zu vermeiden.

az group delete \
  --name "$RG" \
  --yes \
  --no-wait
