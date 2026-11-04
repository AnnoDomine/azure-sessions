#!/usr/bin/env bash
# ==============================================================================
# 15. CONTAINER STOPPEN
# ==============================================================================
# Stoppt die laufende Container-Instanz.
# Parameter:
#   "$CONTAINER" : Name der Container-Instanz (dev-sec-ops-7)

docker stop "$CONTAINER"
