#!/usr/bin/env bash
# ==============================================================================
# 13. RESSOURCENGRUPPE BEREINIGEN (CLEANUP)
# ==============================================================================
# Löscht die gesamte Resource Group inklusive aller VMs, Disks, Netzwerkressourcen,
# Budgets und Policy Assignments, um keine weiteren Cloud-Kosten zu verursachen.
# Parameter:
#   -n / --name $RG : Name der zu löschenden Resource Group (cloud8-lab-rg)

az group delete \
  -n $RG
