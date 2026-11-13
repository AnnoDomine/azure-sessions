#!/usr/bin/env bash
# ==============================================================================
# 3. LAUFENDE CONTAINER DYNAMISCH ERMITTELN & ENTFERNEN (CLEANUP)
# ==============================================================================
# Liest die Container-ID des auf Port 80 (oder über den Namen) laufenden
# Containers dynamisch in eine Umgebungsvariable aus und entfernt ihn,
# um Ports vor dem Start von Docker Compose freizugeben.

docker ps

export TARGET_CID=$(docker ps --filter "name=$TUTORIAL_CONTAINER" --format "{{.ID}}" | head -n 1)

if [ -n "$TARGET_CID" ]; then
  echo "Entferne Container: $TARGET_CID"
  docker rm -f "$TARGET_CID"
fi
