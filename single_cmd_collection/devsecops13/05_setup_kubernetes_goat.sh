#!/usr/bin/env bash
# ==============================================================================
# 5. KUBERNETES GOAT BEREITSTELLEN (SETUP)
# ==============================================================================
# Setzt die Ausführungsrechte für die Setup-, Access- und Teardown-Skripte
# im Verzeichnis kubernetes-goat und rollt anschließend alle verwundbaren
# Szenario-Workloads sowie das Helm-Chart (metadata-db) im Cluster aus.
# Hinweis: Für Windows liegen im Repository entsprechende .ps1-PowerShell-Skripte.

cd kubernetes-goat

chmod +x setup-kubernetes-goat.sh
chmod +x access-kubernetes-goat.sh
chmod +x teardown-kubernetes-goat.sh

bash setup-kubernetes-goat.sh
