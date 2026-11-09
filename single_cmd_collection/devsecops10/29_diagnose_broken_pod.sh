#!/usr/bin/env bash
# ==============================================================================
# 30. DEFEKTEN POD DIAGNOSTIZIEREN
# ==============================================================================
# Analysiert die Fehlerursache in den Pod-Events (z. B. ErrImagePull, ImagePullBackOff).
# Wichtig: Vorhandene v2-Pods bleiben durch Kubernetes solange aktiv, bis neue Pods
# gesund sind (Zero Downtime Protection).

kubectl describe pods
