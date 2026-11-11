#!/usr/bin/env bash
# ==============================================================================
# 2. LABORUMGEBUNG VOLLSTÄNDIG INITIALISIEREN (SETUP)
# ==============================================================================
# Führt das zentrale Setup-Skript aus. Dies umfasst:
# - Starten eines Minikube-Clusters mit Calico CNI (notwendig für NetworkPolicies)
# - Lokales Bauen des Images für die angreifbare Webanwendung (Cluster Health Dashboard)
# - Bereitstellung der angreifbaren Workload und überprivilegierter RBAC-Rollen
# - Bereitstellung aller isolierten Labor-Namespaces und Standalone-Demos

# In das Labor-Verzeichnis wechseln (falls noch nicht geschehen)
cd k8s-security-lab

# Setup-Skript ausführen
./setup.sh
