#!/usr/bin/env bash
# ==============================================================================
# 3. PORT-FORWARDING FÜR DAS CLUSTER HEALTH DASHBOARD
# ==============================================================================
# Leitet den lokalen Port 5000 an den Service "cluster-health-dashboard" im
# Namespace "default" weiter, um auf die interne Weboberfläche zuzugreifen.
#
# HINWEIS: Dieser Befehl blockiert das Terminal. Führen Sie ihn in einem separaten
# Terminalfenster oder im Hintergrund aus (z. B. via '&').

# Port-Forwarding des Kubernetes-Service einrichten
kubectl port-forward svc/cluster-health-dashboard 5000:5000 -n default
