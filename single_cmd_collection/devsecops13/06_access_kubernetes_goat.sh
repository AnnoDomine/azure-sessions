#!/usr/bin/env bash
# ==============================================================================
# 6. KUBERNETES GOAT PORT-FORWARDING STARTEN (ACCESS)
# ==============================================================================
# Prüft den Ready-Status der Szenario-Pods und richtet im Hintergrund
# Port-Forwardings auf die lokalen Ports 1230 bis 1236 ein.
# Das zentrale Web-Dashboard ist anschließend unter http://127.0.0.1:1234
# erreichbar.

cd kubernetes-goat

bash access-kubernetes-goat.sh
