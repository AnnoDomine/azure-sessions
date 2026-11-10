#!/usr/bin/env bash
# ==============================================================================
# 6. TERRAFORM INFRASTRUKTUR-BEREITSTELLUNG (APPLY)
# ==============================================================================
# Führt die geplante Bereitstellung in Microsoft Azure aus und erstellt die
# Resource Group ('rg-dev-aks') sowie den AKS-Cluster ('aks-west-eu') mit den
# in 'terraform.tfvars' konfigurierten Node-Pools.

terraform apply
