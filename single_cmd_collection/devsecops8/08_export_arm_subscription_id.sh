#!/usr/bin/env bash
# ==============================================================================
# 3. AZURE SUBSCRIPTION-ID ERMITTELN
# ==============================================================================
# Fragt die ID der aktiven Azure-Subscription ab und exportiert sie als
# ARM_SUBSCRIPTION_ID (Standardvariable für den Terraform AzureRM-Provider).

export ARM_SUBSCRIPTION_ID=$(az account show --query id -o tsv)
echo "ARM_SUBSCRIPTION_ID: $ARM_SUBSCRIPTION_ID"
