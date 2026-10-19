#!/usr/bin/env bash
# ==============================================================================
# 10. ÖFFENTLICHE CLIENT-IP ERMITTELN
# ==============================================================================
# Fragt die eigene öffentliche IPv4-Adresse ab und exportiert sie als $MY_IP

export MY_IP=$(curl -s https://api.ipify.org)
