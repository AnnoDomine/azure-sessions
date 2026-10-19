#!/usr/bin/env bash
# ==============================================================================
# 8. RBAC: CONTRIBUTOR-RECHTE FÜR SPEZIFISCHE VM VERGEBEN
# ==============================================================================
# Weist einer Identität (Managed Identity oder Benutzer/Service Principal) die Rolle
# 'Contributor' (Vollzugriff außer Rollenvergabe) gezielt auf den Scope der einzelnen VM zu.
# Hinweis: Soll statt der Managed Identity ein bestimmter Benutzer berechtigt werden,
# wird bei --assignee dessen E-Mail/UPN oder Object-ID übergeben.
# Parameter:
#   --assignee $PRINCIPAL_ID : Ziel-Identität (Principal-ID der Managed Identity oder User Object-ID/UPN)
#   --role "Contributor"     : Built-in Rolle zur vollständigen Verwaltung der Ressource (ohne RBAC-Änderung)
#   --scope $VM_SCOPE        : Geltungsbereich beschränkt auf die Ressourcen-ID der einzelnen VM

export VM_SCOPE=$(az vm show \
  --resource-group $RG \
  --name $VM \
  --query id \
  -o tsv)

az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Contributor" \
  --scope $VM_SCOPE
