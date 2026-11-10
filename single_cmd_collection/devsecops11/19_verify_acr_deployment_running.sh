#!/usr/bin/env bash
# ==============================================================================
# 19. DEPLOYMENT ERNEUT ANWENDEN & ERFOLGREICHEN START VERIFIZIEREN
# ==============================================================================
# Wendet das Deployment nach erfolgter ACR-Anbindung erneut an.
# Der Kubelet kann das Image nun schlüssellos aus der ACR beziehen und
# der Pod startet erfolgreich.

kubectl apply -f deployment.yaml
kubectl get pods
kubectl describe pod
