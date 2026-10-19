#!/usr/bin/env bash
# ==============================================================================
# 7. RBAC: READER-RECHTE FÜR RESOURCE GROUP VERGEBEN
# ==============================================================================
# Weist einer Identität (Managed Identity der VM oder einem Benutzer/Service Principal)
# die Rolle 'Reader' (reine Leseberechtigung) für den Scope der gesamten Resource Group zu.
# Hinweis: Für einen anderen Benutzer kann --assignee auch eine User Principal Name (UPN / E-Mail)
# oder dessen Object-ID erhalten (z. B. --assignee "user@domain.com" oder $PRINCIPAL_ID).
# Parameter:
#   --assignee $PRINCIPAL_ID : Ziel-Identität (hier Principal-ID der VM oder Object-ID/UPN eines Users)
#   --role "Reader"          : Built-in Rolle für reinen Lesezugriff auf alle Ressourcen im Scope
#   --scope $RG_SCOPE        : Geltungsbereich (Ressourcen-ID der Resource Group)

export RG_SCOPE=$(az group show \
  --name $RG \
  --query id \
  -o tsv)

az role assignment create \
  --assignee $PRINCIPAL_ID \
  --role "Reader" \
  --scope $RG_SCOPE
