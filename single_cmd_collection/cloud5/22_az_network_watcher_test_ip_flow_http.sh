#!/usr/bin/env bash
# ==============================================================================
# 17. NETWORK WATCHER: IP-FLOW-VERIFY AUF PORT 80 (HTTP)
# ==============================================================================
# Prüft über Azure Network Watcher, ob eingehender TCP-Verkehr von einer externen IP
# auf Port 80 von web2 durch die NSG-Regeln erlaubt wird (Erwartung: Allow via allow-http)
# Parameter:
#   --resource-group $RG  : Ziel-Resource-Group
#   --vm web2             : Zu überprüfende Ziel-VM
#   --direction Inbound   : Verkehrsrichtung (eingehend zur VM)
#   --protocol TCP        : Geprüftes Protokoll
#   --local $WEB2_IP:80   : Lokale private IP der VM und Zielport 80 (HTTP)
#   --remote 1.2.3.4:12345: Simulierte externe Quell-IP und Quellport

az network watcher test-ip-flow \
  --resource-group $RG \
  --vm web2 \
  --direction Inbound \
  --protocol TCP \
  --local $WEB2_IP:80 \
  --remote 1.2.3.4:12345
