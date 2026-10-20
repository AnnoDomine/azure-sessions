#!/usr/bin/env bash
# ==============================================================================
# 3. RESOURCE LOCK TESTEN (LÖSCHVERSUCH)
# ==============================================================================
# Testet die Wirksamkeit des zuvor erstellten CanNotDelete-Locks.
# Erwartetes Verhalten: Der Befehl schlägt mit einem 'ScopeLocked'-Fehler fehl,
# da die Resource Group durch den Lock 'no-delete' geschützt ist.
# Parameter:
#   --name $RG : Name der Resource Group (cloud7-gov-rg)
#   --yes      : Überspringt die interaktive Bestätigungsabfrage

az group delete \
  --name $RG \
  --yes
