#!/usr/bin/env bash
# ==============================================================================
# 13. RBAC-ROLLE "KEY VAULT SECRETS USER" AN VM-IDENTITÄT ZUWEISEN
# ==============================================================================
# Weist der Managed Identity der VM die Built-in Rolle "Key Vault Secrets User"
# auf Scope des Key Vaults zu. Dies folgt dem Least-Privilege-Prinzip: Die VM darf
# Secrets nur lesen, aber keine erstellen oder modifizieren.
# Parameter:
#   --assignee "$VM_PRINCIPAL_ID"    : Principal-ID der Managed Identity der VM
#   --role "Key Vault Secrets User"  : Rolle mit ausschließlichen Leserechten auf Secrets
#   --scope "$KV_ID"                 : Scope-Begrenzung auf den spezifischen Key Vault

az role assignment create \
  --assignee "$VM_PRINCIPAL_ID" \
  --role "Key Vault Secrets User" \
  --scope "$KV_ID"
