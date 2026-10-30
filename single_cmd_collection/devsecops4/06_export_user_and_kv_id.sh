#!/usr/bin/env bash
# ==============================================================================
# 4. BENUTZER-OBJECT-ID & KEY-VAULT-RESSOURCEN-ID AUSLESEN
# ==============================================================================
# Liest die Entra-ID Object-ID des aktuell angemeldeten Benutzers sowie die
# vollständige Azure-Ressourcen-ID des Key Vaults aus und speichert sie in
# Umgebungsvariablen für das anschließende RBAC Role Assignment.
# Parameter:
#   --query id : Extrahiert das Feld 'id'
#   -o tsv     : Tab-Separated Values (reiner Text ohne Anführungszeichen)

export USER_ID=$(az ad signed-in-user show --query id -o tsv)
export KV_ID=$(az keyvault show --name "$KV_NAME" --query id -o tsv)

echo "USER_ID: $USER_ID"
echo "KV_ID:   $KV_ID"
