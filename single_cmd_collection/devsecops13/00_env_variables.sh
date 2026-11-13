#!/usr/bin/env bash
# ==============================================================================
# 0. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Zentrale Umgebungsvariablen für DevSecOps 13 (Kubernetes Goat Security Lab):
# Enthält Repository-URL, Verzeichnisnamen, GPG-Key-Fingerprint für Helm sowie
# den verwendeten Minikube-Treiber.

export KUBEGOAT_REPO="https://github.com/madhuakula/kubernetes-goat.git"
export KUBEGOAT_DIR="kubernetes-goat"
export HELM_BUILDKITE_APT_KEY_ID="DDF78C3E6EBB2D2CC223C95C62BA89D07698DBC6"
export MINIKUBE_DRIVER="docker"
