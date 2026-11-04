#!/usr/bin/env bash
# ==============================================================================
# 5. WSL PFAD-KONFIGURATION (OPTIONAL / WINDOWS WSL)
# ==============================================================================
# Ergänzt die PATH-Variable unter Windows Subsystem for Linux (WSL),
# um auf die Docker-Desktop-Binaries des Windows-Hosts zugreifen zu können.

export PATH=$PATH:"/mnt/c/Program Files/Docker/Docker/resources/bin"
