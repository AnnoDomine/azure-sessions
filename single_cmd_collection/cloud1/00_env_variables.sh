#!/usr/bin/env bash
# ==============================================================================
# 0. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Zentrale Variablen für Cloud 1 (Azure CLI Basis-Workflow).
# Hinweis: Storage-Account-Namen müssen weltweit eindeutig sein (3–24 Zeichen,
# ausschließlich Kleinbuchstaben und Ziffern).

export RG="demo-rg"
export LOCATION="westeurope"
export ZONE=1
export STORAGE="demostorage$RANDOM"
export VM_NAME="my-VM"
export VM_IMAGE="Ubuntu2404"
export VM_SIZE="Standard_D2s_v6"
export VM_IP_SKU="Standard"
export ADMIN_USER="azureuser"
export SSH_KEY_PUB="$HOME/.ssh/id_ed25519.pub"
