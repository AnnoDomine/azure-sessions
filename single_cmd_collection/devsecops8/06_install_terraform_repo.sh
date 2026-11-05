#!/usr/bin/env bash
# ==============================================================================
# 2. HASHICORP APT-REPOSITORIUM HINZUFÜGEN
# ==============================================================================
# Trägt das offizielle HashiCorp APT-Paket-Repository in die Quellenliste ein.

echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
