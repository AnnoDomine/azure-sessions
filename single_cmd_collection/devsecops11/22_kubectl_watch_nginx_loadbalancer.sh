#!/usr/bin/env bash
# ==============================================================================
# 22. EXTERNE PUBLIC-IP DES AZURE LOAD BALANCERS ÜBERWACHEN
# ==============================================================================
# Verfolgt fortlaufend (-w / --watch) den Status des Services.
# Sobald der Azure Cloud-Provider den Azure Load Balancer und die öffentliche IP
# provisioniert hat, wechselt 'EXTERNAL-IP' von '<pending>' zu einer erreichbaren Public-IP.
# Beenden mit Strg+C.

kubectl get service "$NG_LB" -n "$LB_NS" -w
