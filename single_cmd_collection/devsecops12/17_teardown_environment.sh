#!/usr/bin/env bash
# ==============================================================================
# 17. LABORUMGEBUNG VOLLSTÄNDIG BEREINIGEN (TEARDOWN)
# ==============================================================================
# Führt das Teardown-Skript aus, welches den Minikube-Cluster vollständig
# stoppt und löscht ("minikube delete"). Dies stellt eine rückstandsfreie
# Bereinigung sicher.

# In das Labor-Verzeichnis wechseln (falls noch nicht geschehen)
cd k8s-security-lab

# Teardown ausführen
./teardown.sh
