#!/usr/bin/env bash
# ==============================================================================
# 4. NSG-REGEL "ALLOW SSH" PER AZ CLI ERMITTELN & LÖSCHEN
# ==============================================================================
# Ermittelt den Namen der automatisch erzeugten Network Security Group (NSG)
# sowie die SSH-Regel (Port 22) dynamisch über JMESPath und löscht sie.
# Effekt (Stateful Firewall): Bereits aktive SSH-Sitzungen bleiben bestehen,
# neue SSH-Verbindungsaufbauten werden jedoch sofort blockiert.

export NSG_NAME=$(az network nsg list \
  --resource-group "$RG" \
  --query "[0].name" \
  --output tsv)

# Alle benutzerdefinierten Regeln der NSG tabellarisch anzeigen
az network nsg rule list \
  --resource-group "$RG" \
  --nsg-name "$NSG_NAME" \
  --output table

# Regel für Port 22 (SSH) dynamisch ermitteln und löschen
export SSH_RULE_NAME=$(az network nsg rule list \
  --resource-group "$RG" \
  --nsg-name "$NSG_NAME" \
  --query "[?destinationPortRange=='22'].name | [0]" \
  --output tsv)

az network nsg rule delete \
  --resource-group "$RG" \
  --nsg-name "$NSG_NAME" \
  --name "$SSH_RULE_NAME"
