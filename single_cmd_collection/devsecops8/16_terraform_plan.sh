#!/usr/bin/env bash
# ==============================================================================
# 5. TERRAFORM AUSFÜHRUNGSPLAN (PLAN)
# ==============================================================================
# Vergleicht den aktuellen Status mit der Konfiguration und ermittelt geplante Änderungen.
# Hinweis: Mit -out=tfplan kann der Plan deterministisch in einer Datei gespeichert werden.

terraform plan

# Optionaler benannter Plan:
# terraform plan -out=tfplan
