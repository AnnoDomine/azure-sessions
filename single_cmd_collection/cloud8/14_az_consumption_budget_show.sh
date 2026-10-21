#!/usr/bin/env bash
# ==============================================================================
# 9. AZURE COST MANAGEMENT BUDGET ABFRAGEN
# ==============================================================================
# Zeigt die Details und aktuellen Verbrauchswerte des erstellten Budgets an.
# Parameter:
#   --budget-name "cloud8-monthly" : Name des abzufragenden Budgets
#   --output table                 : Formatierte Tabellenausgabe

az consumption budget show \
  --budget-name "cloud8-monthly" \
  --output table
