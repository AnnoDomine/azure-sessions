#!/usr/bin/env bash
# ==============================================================================
# 15. INTERAKTIVE SHELL IM POD STARTEN
# ==============================================================================
# Öffnet eine interaktive TTY-Bash-Sitzung innerhalb des laufenden Containers
# zur direkten Fehlersuche oder Überprüfung der Dateistruktur.

kubectl exec -it "$POD_NAME" -- bash
