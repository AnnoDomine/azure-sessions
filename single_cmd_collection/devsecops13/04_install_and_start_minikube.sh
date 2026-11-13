#!/usr/bin/env bash
# ==============================================================================
# 4. MINIKUBE INSTALLATION & CLUSTER-START
# ==============================================================================
# Lädt das aktuelle Minikube-Binary für Linux (amd64) herunter, installiert es
# systemweit nach /usr/local/bin/minikube und startet einen lokalen Cluster
# mit dem Docker-Treiber.

curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube start --driver=docker
