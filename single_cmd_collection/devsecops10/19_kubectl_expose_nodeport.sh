#!/usr/bin/env bash
# ==============================================================================
# 20. SERVICE ALS NODEPORT EXPONIEREN
# ==============================================================================
# Erstellt einen Kubernetes-Service vom Typ NodePort, um das Deployment über
# einen statischen Port auf dem Clusterknoten von außen erreichbar zu machen.
# Parameter:
#   --type="NodePort" : Öffnet einen Port auf jedem Cluster-Knoten (Bereich 30000-32767)
#   --port 8080       : Zielport, auf dem der Container im Pod lauscht

kubectl expose deployment/kubernetes-bootcamp \
  --type="NodePort" \
  --port 8080
