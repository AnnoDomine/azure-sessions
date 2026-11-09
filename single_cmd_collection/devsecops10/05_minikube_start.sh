#!/usr/bin/env bash
# ==============================================================================
# 6. MINIKUBE CLUSTER STARTEN
# ==============================================================================
# Startet eine lokale Single-Node Kubernetes-Umgebung unter Nutzung des Docker-Treibers.
# Parameter:
#   --driver=docker : Verwendet die lokale Docker-Engine zur Isolation des Minikube-Knotens

minikube start --driver=docker
