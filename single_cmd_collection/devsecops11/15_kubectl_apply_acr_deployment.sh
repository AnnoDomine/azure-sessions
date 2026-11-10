#!/usr/bin/env bash
# ==============================================================================
# 15. DEPLOYMENT ANWENDEN & IMAGE-PULL-AUTHENTIFIZIERUNG PRÜFEN
# ==============================================================================
# Wendet das Deployment auf den AKS-Cluster an und inspiziert den Pod-Status.
# Hinweis zum Lerneffekt:
# Da der AKS-Cluster zu diesem Zeitpunkt noch keine Leseberechtigung (AcrPull)
# auf die private Azure Container Registry besitzt, verharrt der Pod im Status
# 'ImagePullBackOff' bzw. 'ErrImagePull' (HTTP 401 Unauthorized).

kubectl apply -f deployment.yaml
kubectl get pods
kubectl describe pod
