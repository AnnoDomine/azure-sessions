#!/usr/bin/env bash
# ==============================================================================
# 0. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Alle Basis-Umgebungsvariablen für DevSecOps 11 (Kubernetes on Azure - AKS & ACR):

# Azure Ressourcen-Konfiguration
export RG="rg-dev-aks"
export CLUSTER="aks-west-eu"
export REGION="westeurope"

# Azure Container Registry (ACR) & Container Image
export ACR="devsecops11acr$(openssl rand -hex 4)"
export CONTAINER="dev-sec-ops-11"
export CONTAINER_LINK="${ACR}.azurecr.io/${CONTAINER}:latest"
export ACR_DEMO_NAME="acr-image-demo"

# Demo 2: Nginx & Azure Load Balancer
export LB_NS="demo2-loadbalancer"
export NG_LB="nginx-loadbalancer"

# Demo 3: StatefulSet & Persistent Volumes
export SF_NS="demo3-statefulset"

# Dynamisch ermittelte Variablen (werden im Verlauf der Session gesetzt):
# export ACR_ID=$(az acr show --name "$ACR" --query id -o tsv)
# export KUBELET_ID=$(az aks show -g "$RG" -n "$CLUSTER" --query identityProfile.kubeletidentity.objectId -o tsv)
# export ACR_MODE=$(az acr show --name "$ACR" --query roleAssignmentMode -o tsv)
