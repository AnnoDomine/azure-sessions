#!/usr/bin/env bash
# ==============================================================================
# 3. RBAC-ROLLENDEFINITIONEN & ZUWEISUNGEN PRÜFEN
# ==============================================================================
# Listet alle aktiven Rollenzuweisungen (Role Assignments) für den aktuell
# angemeldeten Benutzer auf Subscription-Ebene auf.
# Parameter:
#   --assignee $(...)                              : Object-ID oder UPN des Benutzers/Prinzipals
#   --scope /subscriptions/$SUB_ID                 : Geltungsbereich (Scope) auf Subscription-Ebene
#   --query "[].{role:roleDefinitionName, scope:scope}" : Zeigt Rollenname und zugehörigen Scope
#   -o table                                       : Übersichtliche Tabellenform

az role assignment list \
  --assignee $(az ad signed-in-user show --query id -o tsv) \
  --scope /subscriptions/$SUB_ID \
  --query "[].{role:roleDefinitionName, scope:scope}" \
  -o table
