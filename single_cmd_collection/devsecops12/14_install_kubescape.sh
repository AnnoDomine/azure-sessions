#!/usr/bin/env bash
# ==============================================================================
# 14. KUBESCAPE INSTALLIEREN & PFAD KONFIGURIEREN
# ==============================================================================
# Kubescape ist ein führendes Open-Source-Sicherheits- und Compliance-Tool für
# Kubernetes (Shift-Left & Runtime Security).
#
# Lädt das offizielle Installationsskript herunter, führt die Installation durch,
# bindet das Binary in den PATH ein und prüft die installierte Version.

echo "=== Kubescape herunterladen und installieren ==="
curl -s https://raw.githubusercontent.com/kubescape/kubescape/master/install.sh | /bin/bash

# Pfad zur Umgebung hinzufügen
export PATH="$PATH:$HOME/.kubescape/bin"

echo -e "\n=== Kubescape Version überprüfen ==="
kubescape version
