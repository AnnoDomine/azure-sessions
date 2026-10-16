#!/usr/bin/env bash
# ==============================================================================
# 1. UMGEBUNGSVARIABLEN (ENVIRONMENT VARIABLES)
# ==============================================================================
# Alle Basis-Umgebungsvariablen für Cloud 6 (Load Balancer, Application Gateway, WAF) gesammelt:

export RG="cloud6-lab-rg"
export REGION="germanywestcentral"
export VNET="cloud6-vnet"
export LOAD_BALANCER_IP_NAME="lb-ip"
export LB="myLB"
export GW="myAppGW"
export GW_SUB="appgw-subnet"
export GW_IP="appgw-ip"
export WAF_POL="myWAFPolicy"
