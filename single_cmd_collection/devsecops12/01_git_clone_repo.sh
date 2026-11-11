#!/usr/bin/env bash
# ==============================================================================
# 1. GIT REPOSITORY KLONEN & VORBEREITEN
# ==============================================================================
# Entfernt eventuell bestehende Alt-Klone des Kubernetes Security Labs, um mit
# einer sauberen Umgebung zu starten, klont das offizielle Repository von
# Cybersteps und wechselt in das Projektverzeichnis.

# Altes Klon-Verzeichnis bereinigen
rm -rf ./k8s-security-lab

# Repository klonen
git clone https://github.com/CyberstepsDE/k8s-security-lab.git

# In das Labor-Verzeichnis wechseln
cd k8s-security-lab
