#!/usr/bin/env bash
# ==============================================================================
# 16. KUBELET-IDENTITÄT, ACR-ID & RBAC-ROLLE ERMITTELN
# ==============================================================================
# Liest die Ressourcen-ID der Azure Container Registry und die Object-ID der
# AKS-Kubelet-Identität (System-Assigned Managed Identity) aus.
# Anschließend wird geprüft, ob ABAC (Attribute-Based Access Control) aktiviert ist,
# um dynamisch die korrekte Rolle ('Container Registry Repository Reader' oder 'AcrPull') zu wählen.

export ACR_ID=$(az acr show --name "$ACR" --query id -o tsv)

export KUBELET_ID=$(az aks show -g "$RG" -n "$CLUSTER" --query identityProfile.kubeletidentity.objectId -o tsv)

export ACR_MODE=$(az acr show --name "$ACR" --query roleAssignmentMode -o tsv)

if [ "$ACR_MODE" = "AbacRepositoryPermissions" ]; then
  export ROLE="Container Registry Repository Reader"
else
  export ROLE="AcrPull"
fi

echo "ACR_ID: $ACR_ID"
echo "KUBELET_ID: $KUBELET_ID"
echo "ROLE: $ROLE"
