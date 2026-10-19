#!/usr/bin/env bash
# ==============================================================================
# 9. RBAC-ZUWEISUNGEN DER MANAGED IDENTITY ÜBERPRÜFEN
# ==============================================================================
# Listet alle Rollenzuweisungen (Role Assignments) für die Managed Identity
# (oder den zugewiesenen Prinzipal) über alle Scopes innerhalb der Subscription auf.
# Parameter:
#   --assignee $PRINCIPAL_ID                            : Object-ID / Principal-ID des Empfängers
#   --all                                               : Zeigt Zuweisungen über alle untergeordneten Scopes (RG, VM) an
#   --query "[].{role:roleDefinitionName, scope:scope}" : Filtert die Ausgabe auf Rollenname und Scope
#   -o table                                            : Formatierte Tabellenausgabe

az role assignment list \
  --assignee $PRINCIPAL_ID \
  --all \
  --query "[].{role:roleDefinitionName, scope:scope}" \
  -o table
