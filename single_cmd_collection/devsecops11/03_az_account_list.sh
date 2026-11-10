#!/usr/bin/env bash
# ==============================================================================
# 3. AZURE SUBSCRIPTION ERMITTELN & IN TERRAFORM KONFIGURIEREN
# ==============================================================================
# Listet alle dem angemeldeten Azure-Konto zugewiesenen Subscriptions tabellarisch auf.
# Die gefundene Subscription ID muss anschließend in der Konfigurationsdatei
# 'terraform.tfvars' bzw. 'variables.tf' eingetragen werden:
#
# Beispiel terraform.tfvars:
#   subscription_id = "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx"

az account list --output table
