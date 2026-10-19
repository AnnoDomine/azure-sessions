#!/usr/bin/env bash
# ==============================================================================
# 2. ANGEMELDETEN BENUTZER & SUBSCRIPTION-ID ABFRAGEN
# ==============================================================================
# Zeigt den Anzeigenamen (displayName) und die Entra-ID Object-ID (id) des aktuell
# in der Azure CLI angemeldeten Benutzers an.
# Parameter:
#   --query "{name:displayName, objectId:id}" : JMESPath-Filter für Name und Object-ID
#   -o table                                  : Formatierte Tabellenausgabe

az ad signed-in-user show \
  --query "{name:displayName, objectId:id}" \
  -o table
