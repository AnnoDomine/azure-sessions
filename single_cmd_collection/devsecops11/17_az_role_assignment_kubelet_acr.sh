#!/usr/bin/env bash
# ==============================================================================
# 17. RBAC-ROLLE AN AKS-KUBELET-IDENTITÄT ZUWEISEN (ACRPULL)
# ==============================================================================
# Weist der Kubelet Managed Identity des AKS-Clusters Leserechte auf die
# Azure Container Registry zu, damit der Node-Agent Container-Images schlüssellos
# authentifiziert herunterladen kann.
# Parameter:
#   --assignee-object-id "$KUBELET_ID"       : Object-ID der AKS Kubelet Managed Identity
#   --assignee-principal-type ServicePrincipal: Principal-Typ der Managed Identity
#   --role "$ROLE"                           : RBAC-Rolle (AcrPull bzw. Container Registry Repository Reader)
#   --scope "$ACR_ID"                        : Azure-Ressourcenpfad der Ziel-ACR

az role assignment create \
  --assignee-object-id "$KUBELET_ID" \
  --assignee-principal-type ServicePrincipal \
  --role "$ROLE" \
  --scope "$ACR_ID"
