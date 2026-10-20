# AGENTS.md

## Repository Overview

Dieses Repository dient als minimalistische Datenbank und Referenzsammlung für **Azure Sessions auf Cybersteps** unter Verwendung der **Azure CLI (`az`) auf Linux**.
Für jede Session werden die Befehle separat, strukturiert und inklusive verständlicher Erklärungen vorgehalten.

## Strict Agent Rules

> [!CAUTION]
> **STRIKTES AUSFÜHRUNGSVERBOT**:
> Das Ausführen jeglicher Azure-Skripte oder `az`-Befehle (über Shell, Subshell, Python etc.) ist für Agenten **ausnahmslos verboten**.
> Es dürfen keine Cloud-Ressourcen erstellt, modifiziert, gestartet oder gelöscht werden.

- **Reine Dokumentations- & Code-Arbeit**: Befehle und Skripte dürfen ausschließlich gelesen, extrahiert, modularisiert, syntaktisch korrigiert und dokumentiert werden.
- **Sprachkonvention**: Kommunikations- und Dokumentationssprache ist **Deutsch**. Code, Variablennamen, Pfade und CLI-Argumente bleiben **Englisch** bzw. nutzen gängige lateinische/englische Fachtermini.
- **Bash-Syntax**: Bei mehrzeiligen CLI-Befehlen (`\`) dürfen keine Inline-Kommentare hinter dem Zeilenfortführungs-Backslash stehen, da dies in Bash zu Syntaxfehlern führt. Erklärungen gehören als strukturierte Kommentare über den Befehl.
- **Relative Pfade in Markdown**: Für Verlinkungen in Markdown-Dateien (`.md`) sind ausschließlich **relative Pfade** (z. B. `./cloud3.sh` oder `./single_cmd_collection/cloud3/`) und **keine absoluten Pfade** (`file:///...` oder `/home/...`) zu verwenden.
- **Sammelskripte (`*.sh` im Root / `.gitignore`)**: Sammelskripte wie z. B. `cloud3.sh`, `cloud5.sh` im Root-Verzeichnis sind in `.gitignore` eingetragen und nicht Teil des Repositories. Der Agent darf diese Dateien zur Extraktion und Dokumentationserstellung **ausschließlich lesen, aber keinesfalls bearbeiten, verändern oder löschen**.
