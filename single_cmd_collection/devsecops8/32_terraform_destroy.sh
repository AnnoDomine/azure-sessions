#!/usr/bin/env bash
# ==============================================================================
# 10. RESSOURCEN VOLLSTÄNDIG BEREINIGEN (DESTROY)
# ==============================================================================
# Löscht alle von Terraform verwalteten Ressourcen (VM, VNet, Resource Group) geordnet ab.
# Parameter / Optionen:
#   -auto-approve : Bestätigt das Löschen ohne manuelle Rückfrage

terraform destroy

# Mit automatischer Bestätigung:
# terraform destroy -auto-approve
