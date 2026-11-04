#!/usr/bin/env bash
# ==============================================================================
# 3. AZURE RESOURCE PROVIDER REGISTRIEREN
# ==============================================================================
# Registriert den Resource Provider 'Microsoft.ContainerRegistry' für die Subscription,
# falls dieser noch nicht aktiv ist.
# Parameter:
#   --namespace Microsoft.ContainerRegistry : Der Provider-Namespace für Azure Container Registries
#   --wait                                  : Blockiert und wartet, bis die Registrierung vollständig abgeschlossen ist

az provider register \
  --namespace Microsoft.ContainerRegistry \
  --wait
