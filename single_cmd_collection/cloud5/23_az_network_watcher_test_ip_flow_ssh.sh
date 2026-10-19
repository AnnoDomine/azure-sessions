#!/usr/bin/env bash
# ==============================================================================
# 17. NETWORK WATCHER: IP-FLOW-VERIFY AUF PORT 22 (SSH)
# ==============================================================================
# Prüft über Azure Network Watcher, ob eingehender TCP-Verkehr von einer externen IP
# auf Port 22 (SSH) von web2 durch die NSG-Regeln erlaubt oder blockiert wird
# Parameter:
#   --resource-group $RG  : Ziel-Resource-Group
#   --vm web2             : Zu überprüfende Ziel-VM
#   --direction Inbound   : Verkehrsrichtung (eingehend zur VM)
#   --protocol TCP        : Geprüftes Protokoll
#   --local $WEB2_IP:22   : Lokale private IP der VM und Zielport 22 (SSH)
#   --remote 1.2.3.4:12345: Simulierte externe Quell-IP und Quellport

az network watcher test-ip-flow \
  --resource-group $RG \
  --vm web2 \
  --direction Inbound \
  --protocol TCP \
  --local $WEB2_IP:22 \
  --remote 1.2.3.4:12345
