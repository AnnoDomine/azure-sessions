#!/usr/bin/env bash
# ==============================================================================
# 12. POD-NAMEN EXTRAHIEREN
# ==============================================================================
# Filtert über das Label 'app=kubernetes-bootcamp' den Namen des aktiven Pods
# und speichert ihn in der Umgebungsvariable $POD_NAME.

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"

export POD_NAME=$(kubectl get pods -l app=$KUBERNETES_NAMESPACE -o jsonpath='{.items[0].metadata.name}')
echo "Aktiver Pod: $POD_NAME"
