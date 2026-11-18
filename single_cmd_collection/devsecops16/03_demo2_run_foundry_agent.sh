#!/usr/bin/env bash
# ==============================================================================
# 3. DEMO 2: INDIRECT PROMPT INJECTION VIA FOUNDRY AGENT (FILE SEARCH / RAG)
# ==============================================================================
# Installiert die benötigten Python-Abhängigkeiten (inkl. `azure-ai-agents`),
# liest den `PROJECT_ENDPOINT` aus der lokalen `.env`-Datei und startet den
# echten Foundry Agent (`03-demo2-real-agent.py`).
#
# Funktionsweise & Erwartetes Ergebnis:
# - Authentifizierung erfolgt schlüssellos über `DefaultAzureCredential`
#   (nutzt die aktive `az login`-Session) gegen das Foundry-Projekt.
# - Der Agent nutzt einen realen Vector Store mit File Search auf Basis von
#   `vacation-policy.txt`, die einen versteckten Injection-Block enthält.
# - Das Modell ignoriert die eingeschleuste Anweisung (kein
#   `DOCUMENT_INSTRUCTION_EXECUTED`-Marker), beantwortet die Frage korrekt
#   ("24 paid vacation days") und zitiert die Quelldatei.

pip install -r requirements.txt

export PROJECT_ENDPOINT=$(grep PROJECT_ENDPOINT .env | cut -d= -f2-)

python3 03-demo2-real-agent.py
