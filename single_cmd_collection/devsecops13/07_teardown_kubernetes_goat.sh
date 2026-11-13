#!/usr/bin/env bash
# ==============================================================================
# 7. KUBERNETES GOAT BEREINIGEN (TEARDOWN)
# ==============================================================================
# Entfernt alle in Kubernetes Goat ausgerollten Manifeste, ClusterRoles,
# ClusterRoleBindings, ServiceAccounts und das Helm-Release (metadata-db).

cd kubernetes-goat

bash teardown-kubernetes-goat.sh
