#!/usr/bin/env bash
# ==============================================================================
# 5. TERRAFORM ÄNDERUNGEN ANWENDEN (APPLY)
# ==============================================================================
# Führt die geplanten Aktionen aus, um den gewünschten Zielzustand in Azure herzustellen.
# Parameter / Optionen:
#   -auto-approve : Überspringt die manuelle Bestätigungsabfrage (yes)

terraform apply

# Automatisches Bestätigen:
# terraform apply -auto-approve

# Anwenden eines zuvor gespeicherten Plans:
# terraform apply tfplan
