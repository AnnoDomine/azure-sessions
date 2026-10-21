#!/usr/bin/env bash
# ==============================================================================
# 4. AZURE ADVISOR KOSTENEMPFEHLUNGEN ABFRAGEN
# ==============================================================================
# Aktualisiert und listet die Kostenoptimierungsempfehlungen von Azure Advisor
# (z. B. nicht ausgelastete VMs, Reserved Instances) für die Subscription auf.
# Parameter:
#   --category Cost : Filtert die Empfehlungen gezielt auf die Kategorie 'Cost'
#   --refresh       : Stößt eine Aktualisierung der Advisor-Empfehlungen an
#   --output table  : Gibt die Ergebnisse als übersichtliche Tabelle aus

az advisor recommendation list \
  --category Cost \
  --refresh \
  --output table
