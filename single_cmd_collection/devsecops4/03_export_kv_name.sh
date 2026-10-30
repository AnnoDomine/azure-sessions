#!/usr/bin/env bash
# ==============================================================================
# 1. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Generiert einen weltweit eindeutigen Namen für den Azure Key Vault.
# Key-Vault-Namen müssen global über alle Azure-Kunden hinweg eindeutig sein
# und dürfen nur alphanumerische Zeichen und Bindestriche enthalten (3-24 Zeichen).

export KV_NAME="kv-$(openssl rand -hex 6)"
