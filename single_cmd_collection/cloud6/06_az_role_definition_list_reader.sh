#!/usr/bin/env bash
# ==============================================================================
# 3. RBAC-ROLLENDEFINITIONEN & ZUWEISUNGEN PRÜFEN
# ==============================================================================
# Liest die Rollendefinition der eingebauten Rolle 'Reader' aus und zeigt deren
# erlaubte Aktionen (permissions.actions) im JSON-Format an.
# Parameter:
#   --name Reader                                                 : Name der abzufragenden Built-in Role
#   --query "[0].{role:roleName, actions:permissions[0].actions}" : Filtert Rollennamen und erlaubte Aktionen
#   -o json                                                       : Ausgabe als strukturiertes JSON

az role definition list \
  --name Reader \
  --query "[0].{role:roleName, actions:permissions[0].actions}" \
  -o json
