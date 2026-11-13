#!/usr/bin/env bash
# ==============================================================================
# 3. KUBECTL DOWNLOAD & CHECKSUM-DATEI
# ==============================================================================
# Lädt das aktuelle stabile kubectl-Binary für Linux (amd64) sowie die
# zugehörige SHA256-Prüfsumme herunter.
# Hinweis: Zur Verifikation und Installation können anschließend
# `echo "$(cat kubectl.sha256)  kubectl" | sha256sum --check` sowie
# `sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl`
# ausgeführt werden.

curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl.sha256"
