#!/usr/bin/env bash
# ==============================================================================
# 2. PYTHON VIRTUAL ENVIRONMENT ERSTELLEN
# ==============================================================================
# Erstellt eine isolierte Python-3-Umgebung (Virtual Environment) im Verzeichnis
# 'prowler-env', um Abhängigkeiten und Tools sauber vom System-Python zu trennen.
# Parameter:
#   -m venv      : Startet das integrierte Python-Modul zur Virtualenv-Erstellung
#   prowler-env  : Name des Zielordners für die virtuelle Python-Umgebung

python3 -m venv prowler-env
