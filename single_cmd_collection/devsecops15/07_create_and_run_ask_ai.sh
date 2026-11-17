#!/usr/bin/env bash
# ==============================================================================
# 7. ERSTER API-AUFRUF MIT AIProjectClient & DefaultAzureCredential
# ==============================================================================
# Generiert das Python-Skript ask_ai.py und führt es aus. Die Authentifizierung
# erfolgt schlüssellos über DefaultAzureCredential (nutzt lokal u. a. die
# aktive `az login`-Session) in Kombination mit der zugewiesenen RBAC-Rolle
# "Foundry User".
#
# Erklärung des Ablaufs in ask_ai.py:
# - AIProjectClient        : Verbindet sich mit dem $PROJECT_ENDPOINT
# - get_openai_client()    : Liefert einen vorkonfigurierten OpenAI-Client
# - client.responses.create: Sendet einen Prompt an das deployte Modell ($MODEL)

cat << EOF > "./ask_ai.py"
from azure.identity import DefaultAzureCredential
from azure.ai.projects import AIProjectClient

project = AIProjectClient(
    endpoint='$PROJECT_ENDPOINT',
    credential=DefaultAzureCredential()
)

client = project.get_openai_client()

response = client.responses.create(
    model='$MODEL',
    input="Explain what an Azure NSG does in three sentences."
)

print(response.output_text)
EOF

python ask_ai.py
