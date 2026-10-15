#!/usr/bin/env bash
# ==============================================================================
# 7. SSH-VERBINDUNG VIA BASTION (NATIVE CLIENT TUNNELING) - HILFSBEFEHL
# ==============================================================================
# Ermittelt die Ressourcen-ID der VM 'webvm' für den Bastion-SSH-Befehl

az vm show -g $RG -n webvm --query id -o tsv
