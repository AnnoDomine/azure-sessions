#!/usr/bin/env bash
# ==============================================================================
# 0. REPOSITORY KLONEN, PYTHON-VENV & BASIS-SETUP
# ==============================================================================
# Klont das Demo-Repository für AI Security auf Azure, wechselt in das
# Skript-Verzeichnis, setzt Ausführungsrechte und richtet eine isolierte
# Python-Umgebung (venv) ein. Anschließend werden die Umgebungsvariablen aus
# .env geladen und das initiale Azure-Setup-Skript ausgeführt.
#
# Hinweise zur Nutzung:
# - Die Befehle sollten zeilenweise bzw. mit `source` in der aktuellen Shell
#   ausgeführt werden, damit die aktivierte venv und die geladenen
#   Umgebungsvariablen (`.env`) für die nachfolgenden Schritte erhalten bleiben.

git clone https://github.com/CyberstepsDE/ai-security-demos.git
cd ai-security-demos/scripts || exit 1
chmod +x ./*.sh

# Isolierte Python-Umgebung anlegen und aktivieren (für Demo 2 benötigt)
python3 -m venv venv
source venv/bin/activate

# Umgebungsvariablen (z. B. $RG, $AIACCT) laden und Basis-Ressourcen anlegen
source ./.env
./00-setup.sh
