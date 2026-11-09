#!/usr/bin/env bash
# ==============================================================================
# 14. CONTAINER-LOGS DES PODS ABRUFEN
# ==============================================================================
# Gibt die Standardausgabe (stdout/stderr) des laufenden Containers im Pod aus.

kubectl logs "$POD_NAME"
