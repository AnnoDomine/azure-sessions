#!/usr/bin/env bash
# ==============================================================================
# 2. KUBECTL DOWNLOAD & CHECKSUM-PRÜFUNG
# ==============================================================================
# Lädt die offizielle, stabile Version der Kubernetes CLI (kubectl) sowie die
# zugehörige SHA256-Prüfsummendatei herunter und verifiziert die Integrität.

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check
