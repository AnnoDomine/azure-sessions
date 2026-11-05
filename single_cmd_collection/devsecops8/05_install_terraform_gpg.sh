#!/usr/bin/env bash
# ==============================================================================
# 2. HASHICORP GPG-KEYRING INSTALLIEREN
# ==============================================================================
# Lädt den offiziellen HashiCorp GPG-Schlüssel herunter und speichert ihn
# dearmored im Keyring-Verzeichnis des Betriebssystems.

wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
