#!/usr/bin/env bash
# ==============================================================================
# 7. INITIALES SECRET MIT ABLAUFDATUM IM KEY VAULT SPEICHERN
# ==============================================================================
# Erstellt ein Secret namens 'db-password' mit dem Wert 'test' und einem
# definierten Ablaufdatum (Expiration Date) für automatische Secret-Rotation/Governance.
# Parameter:
#   --vault-name "$KV_NAME"          : Name des Key Vaults
#   --name "db-password"             : Bezeichner/Schlüssel des Secrets
#   --value "test"                   : Zu speichernder geheimer Wert
#   --expires "2027-10-30T00:00:00Z" : UTC-Ablaufdatum des Secrets (ISO 8601)

az keyvault secret set \
  --vault-name "$KV_NAME" \
  --name "db-password" \
  --value "test" \
  --expires "2027-10-30T00:00:00Z"
