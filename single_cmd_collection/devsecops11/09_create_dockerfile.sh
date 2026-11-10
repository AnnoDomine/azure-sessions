#!/usr/bin/env bash
# ==============================================================================
# 9. DOCKERFILE FÜR DAS DEMO-IMAGE ERSTELLEN
# ==============================================================================
# Erzeugt ein kompaktes Dockerfile auf Basis von python:3-slim, das beim
# Containerstart lediglich eine Nachricht ausgibt.

cat << 'EOF' > "./Dockerfile"
FROM python:3-slim
WORKDIR /
COPY . .
CMD [ "echo", "Hello World" ]
EOF
