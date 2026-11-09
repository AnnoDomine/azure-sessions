#!/usr/bin/env bash
# ==============================================================================
# 25. LOAD BALANCING VERIFIZIEREN
# ==============================================================================
# Führt mehrfache HTTP-Anfragen durch. Der NodePort Service verteilt die Anfragen
# via internem Round-Robin auf die 4 aktiven Pods (ersichtlich am wechselnden Hostnamen).

export KUBERNETES_NAMESPACE="kubernetes-bootcamp"
export BOOTCAMP_URL="http://$(minikube ip):$(kubectl get service "$KUBERNETES_NAMESPACE" -o jsonpath='{.spec.ports[0].nodePort}')"

echo "Erwartete Ausgabe: wechselnde Pod-Namen pro Request"
curl "$BOOTCAMP_URL"
curl "$BOOTCAMP_URL"
curl "$BOOTCAMP_URL"
curl "$BOOTCAMP_URL"
