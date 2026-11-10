#!/usr/bin/env bash
# ==============================================================================
# 26. STATEFULSET-PODS & PERSISTENT VOLUME CLAIMS PRÜFEN
# ==============================================================================
# Überprüft den Status des erstellten StatefulSet-Pods ('demo3-0') und des
# zugehörigen Persistent Volume Claims (PVC) im Namespace '$SF_NS'.

kubectl get pods -n "$SF_NS"
kubectl get pvc -n "$SF_NS"
