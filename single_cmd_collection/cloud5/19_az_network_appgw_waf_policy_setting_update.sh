#!/usr/bin/env bash
# ==============================================================================
# 14. WAF-POLICY AUF PREVENTION-MODUS AKTIVIEREN
# ==============================================================================
# Schaltet die WAF-Richtlinie scharf, sodass erkannte Angriffe aktiv blockiert werden
# (statt im Detection-Modus nur protokolliert zu werden)
# Parameter:
#   -g / --resource-group $RG : Ziel-Resource-Group
#   --policy-name $WAF_POL    : Name der anzupassenden WAF-Policy
#   --state Enabled           : Aktiviert die WAF-Policy
#   --mode Prevention         : Blockiert schädliche HTTP/HTTPS-Requests aktiv

az network application-gateway waf-policy policy-setting update \
  -g $RG \
  --policy-name $WAF_POL \
  --state Enabled \
  --mode Prevention
