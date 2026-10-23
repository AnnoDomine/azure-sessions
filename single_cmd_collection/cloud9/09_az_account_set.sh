#!/usr/bin/env bash
# ==============================================================================
# 10. AKTIVE SUBSCRIPTION FESTLEGEN
# ==============================================================================
# Setzt den aktiven Kontext der Azure CLI explizit auf die angegebene Subscription,
# um sicherzustellen, dass nachfolgende Befehle und Scans im korrekten Mandanten laufen.
# Parameter:
#   --subscription : ID oder Name der zu aktivierenden Subscription

az account set \
  --subscription "$SUBSCRIPTION_ID"
