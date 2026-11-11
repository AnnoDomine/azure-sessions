#!/usr/bin/env bash
# ==============================================================================
# 7. RBAC-RECHTE AUDITIEREN (KUBECTL AUTH CAN-I)
# ==============================================================================
# Überprüft mit "kubectl auth can-i", ob der ServiceAccount "app-sa" aus dem
# Namespace "default" berechtigt ist, Secrets im fremden Namespace "database"
# zu lesen.
#
# Durch eine fehlerhafte ClusterRole/ClusterRoleBinding ("app-reader") besitzt der
# Account übermäßige Rechte über Namespace-Grenzen hinweg.
#
# Erwartete Rückgabe: "yes"

kubectl auth can-i get secrets \
  --as=system:serviceaccount:default:app-sa \
  -n database
