#!/usr/bin/env bash
# ==============================================================================
# 9. AZURE COST MANAGEMENT BUDGET ERSTELLEN
# ==============================================================================
# Erstellt ein monatliches Kostenbudget über 100 Währungseinheiten für die
# Resource Group, um die Ausgaben im Rahmen von FinOps zu überwachen.
# Parameter:
#   --resource-group $RG  : Ziel-Resource-Group für den Budget-Scope (cloud8-lab-rg)
#   --budget-name "..."   : Eindeutiger Name des Budgets (cloud8-monthly)
#   --category Cost       : Budget-Kategorie (Cost = tatsächliche/prognostizierte Kosten)
#   --amount 100          : Budgetschwellenwert (100 Einheiten der Abrechnungswährung)
#   --time-grain Monthly  : Abrechnungs-/Bewertungsintervall (Monatlich)
#   --time-period '{...}' : Gültigkeitszeitraum des Budgets (Start- und Enddatum in ISO-8601)

az consumption budget create-with-rg \
  --resource-group $RG \
  --budget-name "cloud8-monthly" \
  --category Cost \
  --amount 100 \
  --time-grain Monthly \
  --time-period '{"startDate":"2026-10-01T00:00:00Z","endDate":"2027-11-01T00:00:00Z"}'
