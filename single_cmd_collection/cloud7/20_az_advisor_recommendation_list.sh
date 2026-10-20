#!/usr/bin/env bash
# ==============================================================================
# 9. AZURE ADVISOR EMPFEHLUNGEN ABFRAGEN
# ==============================================================================
# Listet Optimierungsempfehlungen von Azure Advisor (Kosten, Sicherheit,
# Zuverlässigkeit, Leistung, Operational Excellence) für die Subscription auf.
# Parameter:
#   --query "[].{cat:category, problem:shortDescription.problem}" : Zeigt Kategorie und Kurzbeschreibung des Problems
#   -o table                                                      : Formatierte Tabellenausgabe

az advisor recommendation list \
  --query "[].{cat:category, problem:shortDescription.problem}" \
  -o table
