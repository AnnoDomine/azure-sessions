#!/usr/bin/env bash
# ==============================================================================
# 10. RESSOURCENGRUPPE BEREINIGEN (CLEANUP)
# ==============================================================================
# Löscht die gesamte Resource Group inklusive VM, Disks, Netzwerkressourcen,
# Action Group, Alert Rules und Policy Assignments.
# Parameter:
#   -n / --name $RG : Name der zu löschenden Resource Group (cloud7-gov-rg)

az group delete \
  -n $RG
