#!/usr/bin/env bash
# ==============================================================================
# 1. GIT-GRUNDLAGEN & BRANCH-WORKFLOW (UBUNTU CLI)
# ==============================================================================
# Initialisiert ein lokales Repository, legt eine .gitignore-Datei gegen
# versehentliche Secret-Commits an, erstellt einen initialen Commit sowie
# einen Feature-Branch und inspiziert die Commit-Historie.

mkdir -p "$PROJECT_DIR" && cd "$PROJECT_DIR"
git init

# .gitignore gegen versehentliches Einchecken von Secrets/Env-Dateien
cat <<'EOF' > .gitignore
.env
*.pem
*.key
EOF

echo "Hello Security" > readme.txt
git status
git add .gitignore readme.txt
git commit -m "chore: initial commit with secret ignore rules"

# Feature-Branch für isolierte Änderungen & Pull-Request-Review anlegen
git checkout -b "$FEATURE_BRANCH"
git log --oneline --decorate
