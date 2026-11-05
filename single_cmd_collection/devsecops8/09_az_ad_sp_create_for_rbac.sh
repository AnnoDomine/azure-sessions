#!/usr/bin/env bash
# ==============================================================================
# 3. SERVICE PRINCIPAL FÜR TERRAFORM ERSTELLEN
# ==============================================================================
# Erstellt einen Microsoft Entra ID Service Principal mit Contributor-Rolle.
# Parameter:
#   --name "sp-terraform-devsecops" : Name des Dienstkontos
#   --role "Contributor"            : Rolle mit Berechtigung zum Verwalten von Azure-Ressourcen
#   --scopes                        : Geltungsbereich (Scope) für die Rolle
#   -o json                         : Ausgabe als JSON zur Weiterverarbeitung

SP_JSON=$(az ad sp create-for-rbac \
  --name "sp-terraform-devsecops" \
  --role "Contributor" \
  --scopes "/subscriptions/$ARM_SUBSCRIPTION_ID/resourceGroups/$RG" \
  -o json)

echo "$SP_JSON"
