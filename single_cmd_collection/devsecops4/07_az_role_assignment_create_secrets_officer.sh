#!/usr/bin/env bash
# ==============================================================================
# 5. RBAC-ROLLE "KEY VAULT SECRETS OFFICER" ZUWEISEN
# ==============================================================================
# Weist dem aktuell angemeldeten Benutzer die Rolle "Key Vault Secrets Officer"
# gezielt auf den Key Vault zu, um Secrets anlegen, aktualisieren und löschen zu können.
# Parameter:
#   --assignee-object-id $USER_ID : Entra-ID Object-ID des Benutzers
#   --assignee-principal-type User : Typ des Sicherheitsprinzipals
#   --role "Key Vault Secrets Officer" : Built-in Rolle zur vollständigen Secret-Verwaltung
#   --scope $KV_ID                 : Gültigkeitsbereich (Ressourcen-ID des Key Vaults)

az role assignment create \
  --assignee-object-id $USER_ID \
  --assignee-principal-type User \
  --role "Key Vault Secrets Officer" \
  --scope $KV_ID
