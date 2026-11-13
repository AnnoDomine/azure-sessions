#!/usr/bin/env bash
# ==============================================================================
# 3. SSH-VERBINDUNG ZUR VM HERSTELLEN
# ==============================================================================
# Liest bei Bedarf die aktuelle Public IP der VM dynamisch über `az vm show`
# aus und öffnet eine SSH-Sitzung von Ubuntu aus.

export PUBLIC_IP="${PUBLIC_IP:-$(az vm show \
  --resource-group "$RG" \
  --name "$VM_NAME" \
  --show-details \
  --query "publicIps" \
  --output tsv)}"

ssh -o StrictHostKeyChecking=accept-new "$ADMIN_USER@$PUBLIC_IP"
