#!/usr/bin/env bash
# ==============================================================================
# 2. IAC-SICHERHEITSSCAN MIT TRIVY DURCHFÜHREN
# ==============================================================================
# Scannt alle Terraform-Konfigurationsdateien im aktuellen Verzeichnis
# (terragoat/terraform/azure) auf Sicherheits-Fehlkonfigurationen.
# Der zweite Befehl filtert die Ausgabe gezielt auf HIGH- und CRITICAL-Funde.

# Vollständiger IaC-Konfigurationsscan
trivy config .

# Gefilterter Scan nach hohen und kritischen Risiken
trivy config --severity HIGH,CRITICAL .
