#!/usr/bin/env bash
# ==============================================================================
# 0. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Zentrale Variablen für Cloud 2 (Virtual Machines & Compute via Azure CLI).
# Erlaubte Standard-SKUs bei strikter Policy-Governance:
#   standard_b1s, standard_b1ms, standard_b2s, standard_b2ms, standard_b1ls,
#   standard_d2s_v5, standard_d2as_v5, standard_d2s_v6, standard_d2s_v7

export RG="demo-vm-rg"
export LOCATION="westeurope"
export VM_NAME="demo-vm"
export VM_IMAGE="Ubuntu2204"
export VM_SIZE="Standard_B1s"
export ADMIN_USER="azureuser"
