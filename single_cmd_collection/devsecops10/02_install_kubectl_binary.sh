#!/usr/bin/env bash
# ==============================================================================
# 3. KUBECTL BINARY INSTALLIEREN
# ==============================================================================
# Installiert kubectl wahlweise mit Root-Rechten systemweit nach /usr/local/bin
# oder benutzerbezogen nach ~/.local/bin.

# Option A: Systemweite Installation (erfordert sudo)
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl

# Option B: Lokale Benutzerinstallation (ohne sudo)
chmod +x kubectl
mkdir -p ~/.local/bin
mv ./kubectl ~/.local/bin/kubectl
