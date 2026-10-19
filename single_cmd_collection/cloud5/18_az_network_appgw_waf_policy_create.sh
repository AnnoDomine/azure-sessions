#!/usr/bin/env bash
# ==============================================================================
# 13. WEB APPLICATION FIREWALL (WAF) POLICY ERSTELLEN
# ==============================================================================
# Erstellt eine WAF-Richtlinie auf Basis des OWASP Core Rule Sets (CRS) zum Schutz
# vor gängigen Web-Schwachstellen (z. B. SQL-Injection, Cross-Site-Scripting)
# Parameter:
#   -g / --resource-group $RG : Ziel-Resource-Group
#   -n / --name $WAF_POL      : Name der WAF-Policy (myWAFPolicy)
#   --location $REGION        : Azure-Region
#   --type OWASP              : Regelwerk-Typ (Open Worldwide Application Security Project)
#   --version 3.2             : Version des OWASP Core Rule Sets

az network application-gateway waf-policy create \
  -g $RG \
  -n $WAF_POL \
  --location $REGION \
  --type OWASP \
  --version 3.2
