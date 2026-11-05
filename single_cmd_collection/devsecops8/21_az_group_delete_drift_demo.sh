#!/usr/bin/env bash
# ==============================================================================
# 7. DRIFT-DEMO: MANUELLE LÖSCHUNG DER RESSOURCENGRUPPE
# ==============================================================================
# Löscht die Resource Group manuell außerhalb von Terraform, um Konfigurationsdrift zu erzeugen.
# Parameter:
#   -n / --name $RG : Name der Resource Group (dev-sec-ops-8-lab-rg)

az group delete \
  -n $RG
