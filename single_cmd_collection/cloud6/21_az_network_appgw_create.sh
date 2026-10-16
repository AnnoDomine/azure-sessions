#!/usr/bin/env bash
# ==============================================================================
# 16. AZURE APPLICATION GATEWAY (LAYER 7 LOAD BALANCER & WAF) ERSTELLEN
# ==============================================================================
# Erstellt ein Application Gateway mit integrierter Web Application Firewall (WAF_v2)
# Parameter:
#   --resource-group $RG          : Ziel-Resource-Group
#   --name $GW                    : Name des Application Gateways (myAppGW)
#   --location $REGION            : Azure-Region
#   --sku WAF_v2                  : Tarif mit Layer-7-Routing und Web Application Firewall v2
#   --capacity 2                  : Feste Instanzanzahl (2 Instanzen für Hochverfügbarkeit)
#   --vnet-name $VNET             : Zugehöriges Virtual Network
#   --subnet $GW_SUB              : Dediziertes Subnetz für das Application Gateway
#   --public-ip-address $GW_IP    : Öffentliche Frontend-IP-Adresse
#   --servers $WEB1_IP $WEB2_IP   : Private IP-Adressen der Backend-Pool-Server
#   --frontend-port 80            : Öffentlicher Eingangsport am Gateway
#   --http-settings-port 80       : Zielport für die Weiterleitung an die Backend-Server
#   --http-settings-protocol Http : Protokoll zwischen Gateway und Backend-Servern
#   --waf-policy $WAF_POL         : Verknüpfte WAF-Policy (OWASP 3.2 im Prevention-Modus)
#   --priority 100                : Priorität der automatisch erstellten Routing-Regel

az network application-gateway create \
  --resource-group $RG \
  --name $GW \
  --location $REGION \
  --sku WAF_v2 \
  --capacity 2 \
  --vnet-name $VNET \
  --subnet $GW_SUB \
  --public-ip-address $GW_IP \
  --servers $WEB1_IP $WEB2_IP \
  --frontend-port 80 \
  --http-settings-port 80 \
  --http-settings-protocol Http \
  --waf-policy $WAF_POL \
  --priority 100
