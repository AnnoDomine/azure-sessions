#!/usr/bin/env bash
# ==============================================================================
# 8. VERFÜGBARE AZURE SUBSCRIPTIONS AUFLISTEN
# ==============================================================================
# Listet alle Azure-Abonnements (Subscriptions) auf, auf die das angemeldete
# Benutzerkonto Zugriff hat, inklusive Name, Subscription-ID und Status.
# Parameter:
#   --output table : Formatierte tabellarische Darstellung im Terminal

az account list \
  --output table
