#!/usr/bin/env bash
# ==============================================================================
# 1. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Generiert einen weltweit eindeutigen Namen für die Azure Container Registry (ACR).
# ACR-Namen dürfen nur Kleinbuchstaben und Ziffern enthalten (5-50 Zeichen).
# Durch den 4-Byte Hex-Zufallswert wird Namenskollisionen vorgebeugt.

export ACR="devsecops7acr$(openssl rand -hex 4)"
