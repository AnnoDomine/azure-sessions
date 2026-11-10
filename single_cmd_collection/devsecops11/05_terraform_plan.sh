#!/usr/bin/env bash
# ==============================================================================
# 5. TERRAFORM AUSFÜHRUNGSPLAN (PLAN)
# ==============================================================================
# Berechnet die Differenz zwischen dem aktuellen Zustand und der HCL-Konfiguration
# und zeigt die geplanten Aktionen (Erstellung von Resource Group und AKS-Cluster).

terraform plan
