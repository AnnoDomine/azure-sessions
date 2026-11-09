#!/usr/bin/env bash
# ==============================================================================
# 5. MINIKUBE DOWNLOAD & INSTALLATION
# ==============================================================================
# Lädt die neueste Linux-Version von Minikube herunter und installiert das Binary
# nach /usr/local/bin/minikube.

curl -LO https://github.com/kubernetes/minikube/releases/latest/download/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube && rm minikube-linux-amd64
