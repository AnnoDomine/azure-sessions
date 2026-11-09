#!/usr/bin/env bash
# ==============================================================================
# 9. BOOTCAMP-DEPLOYMENT ERSTELLEN
# ==============================================================================
# Erstellt ein neues Kubernetes-Deployment namens 'kubernetes-bootcamp'.
# Parameter:
#   --image : Container-Image aus der Google Container Registry (gcr.io)

kubectl create deployment kubernetes-bootcamp \
  --image=gcr.io/google-samples/kubernetes-bootcamp:v1
