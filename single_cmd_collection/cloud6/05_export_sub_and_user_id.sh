#!/usr/bin/env bash
# ==============================================================================
# 2. ANGEMELDETEN BENUTZER & SUBSCRIPTION-ID ABFRAGEN
# ==============================================================================
# Speichert die aktuelle Azure Subscription-ID sowie die Object-ID des angemeldeten
# Benutzers in Umgebungsvariablen für nachfolgende RBAC-Scoping-Befehle.
# Hinweis: Im Originalskript wurde 'az ad signed-in-user show' in SUB_ID gespeichert;
# für echte Subscription-Scopes wird zusätzlich 'az account show' bereitgestellt.
# Parameter:
#   --query id : Extrahiert das Feld 'id' (Subscription-ID bzw. User Object-ID)
#   -o tsv     : Tab-Separated Values (reiner Textwert ohne JSON-Anführungszeichen)

export USER_OBJECT_ID=$(az ad signed-in-user show --query id -o tsv)
export SUB_ID=$(az account show --query id -o tsv)

echo "USER_OBJECT_ID: $USER_OBJECT_ID"
echo "SUB_ID: $SUB_ID"
