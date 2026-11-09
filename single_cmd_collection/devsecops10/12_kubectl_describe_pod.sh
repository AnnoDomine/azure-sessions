#!/usr/bin/env bash
# ==============================================================================
# 13. POD DETAILS & EVENTS INSPICIEREN
# ==============================================================================
# Zeigt detaillierte Zustandsinformationen, Container-Spezifikationen, IP-Adressen
# und Lifecycle-Events des Ziel-Pods an.

kubectl describe pod "$POD_NAME"
