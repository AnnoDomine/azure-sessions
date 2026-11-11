#!/usr/bin/env bash
# ==============================================================================
# 15. STATISCHE SICHERHEITSANALYSE MIT KUBESCAPE (NSA FRAMEWORK)
# ==============================================================================
# Führt einen statischen Security-Audit (Shift-Left) auf allen Kubernetes-
# Manifesten des Repositories durch.
#
# Das NSA/CISA-Framework prüft Best Practices für Pod Security, RBAC,
# Ressourcenbegrenzungen und Netzwerk-Isolation.
#
# Erklärung der Parameter:
# scan framework nsa : Nutzt das Sicherheits-Framework der NSA & CISA
# .                  : Analysiert alle Manifeste im aktuellen Arbeitsverzeichnis

export PATH="$PATH:$HOME/.kubescape/bin"

kubescape scan framework nsa .
