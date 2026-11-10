#!/usr/bin/env bash
# ==============================================================================
# 8. CLUSTER-KNOTEN & INITIALE PODS VERIFIZIEREN
# ==============================================================================
# Überprüft die Verbindung zum Kubernetes-API-Server und listet alle bereitgestellten
# Worker-Nodes (Ready-Status) sowie eventuell bereits im Default-Namespace laufende Pods auf.

kubectl get nodes
kubectl get pods
