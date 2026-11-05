#!/usr/bin/env bash
# ==============================================================================
# 7. DRIFT-DEMO: ERKENNUNG DES KONFIGURATIONSDRIFTS (PLAN)
# ==============================================================================
# Führt 'terraform plan' aus; Terraform stellt fest, dass die Resource Group
# in Azure gelöscht wurde und plant deren Neuerstellung (+ create).

terraform plan
