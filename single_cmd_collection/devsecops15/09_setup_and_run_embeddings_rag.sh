#!/usr/bin/env bash
# ==============================================================================
# 9. RAG-DEMO MIT EMBEDDINGS & COSINE SIMILARITY
# ==============================================================================
# Installiert `openai` sowie `numpy` und erstellt das Skript embeddings.py.
# Dieses demonstriert ein minimales Retrieval-Augmented Generation (RAG) Muster:
# 1. Authentifizierung über AzureCliCredential + Bearer Token Provider für den
#    Scope "https://ai.azure.com/.default" (keine statischen API-Keys).
# 2. Vektorisierung kleiner Richtlinien-Dokumente via text-embedding-3-small.
# 3. Berechnung der Cosine Similarity zwischen Nutzerfrage und Dokumenten.
# 4. Übergabe des relevantesten Dokuments als strikter Kontext an gpt-5-mini
#    ("Answer only based on the provided context.") zur Minimierung von
#    Halluzinationen.

pip install openai numpy

cat << EOF > "./embeddings.py"
import numpy as np
from openai import OpenAI
from azure.identity import AzureCliCredential, get_bearer_token_provider

client = OpenAI(
    base_url="$PROJECT_ENDPOINT",
    api_key=get_bearer_token_provider(
        AzureCliCredential(),
        "https://ai.azure.com/.default"
    )
)

documents = [
    "Employees receive a yearly training budget of €1,200.",
    "Passwords must contain at least 16 characters.",
    "Employees receive 25 vacation days.",
    "VPN access requires MFA."
]

def embed(text):
    response = client.embeddings.create(
        model="text-embedding-3-small",
        input=text
    )
    return np.array(response.data[0].embedding)

def similarity(a, b):
    return np.dot(a, b) / (
        np.linalg.norm(a) * np.linalg.norm(b)
    )
vectors = [embed(doc) for doc in documents]

question = input("Your question: ")
query_vector = embed(question)

scores = [similarity(query_vector, v) for v in vectors]
context = documents[np.argmax(scores)]

print("\nRetrieved document:", context)
print("Similarity:", max(scores))

response = client.responses.create(
    model="gpt-5-mini",
    instructions="Answer only based on the provided context.",
    input=f"Context: {context}\nQuestion: {question}"
)

print("\nAI:", response.output_text)
EOF

python embeddings.py
