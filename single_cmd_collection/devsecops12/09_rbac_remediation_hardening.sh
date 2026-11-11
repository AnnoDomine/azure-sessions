#!/usr/bin/env bash
# ==============================================================================
# 9. RBAC-HÄRTUNG DURCHFÜHREN (LEAST PRIVILEGE)
# ==============================================================================
# Behebt die Fehlkonfiguration:
# 1. Löscht die übermäßige ClusterRole ("app-reader") und deren ClusterRoleBinding.
# 2. Wendet das gehärtete, namespaced Rollenmodell ("fixed-role.yaml") an.
# 3. Überprüft erneut die Berechtigung – der Zugriff auf "database" Secrets wird verweigert.
#
# Erwartetes Ergebnis am Ende: "no"

echo "=== 1. Lösche überprivilegierte ClusterRole und Binding ==="
kubectl delete clusterrole app-reader
kubectl delete clusterrolebinding app-reader-binding

echo "=== 2. Wende restriktives, Namespace-isoliertes Rollenmodell an ==="
kubectl apply -f manifests/03-rbac-popquiz-live/fixed-role.yaml

echo "=== 3. Überprüfe Berechtigung (Sollte nun 'no' sein) ==="
kubectl auth can-i get secrets \
  --as=system:serviceaccount:default:app-sa \
  -n database
