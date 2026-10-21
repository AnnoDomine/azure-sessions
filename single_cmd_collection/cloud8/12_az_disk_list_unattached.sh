#!/usr/bin/env bash
# ==============================================================================
# 8. VERWAISTE MANAGED DISKS IDENTIFIZIEREN (UNATTACHED DISKS)
# ==============================================================================
# Listet alle Managed Disks in der Resource Group auf, die aktuell keiner VM
# zugeordnet sind (managedBy == null) und dennoch monatliche Speicherkosten verursachen.
# Parameter:
#   --resource-group $RG : Name der Resource Group (cloud8-lab-rg)
#   --query "..."        : Filtert auf nicht angehängte Disks (managedBy==null) und
#                          zeigt Name, Größe (GB), SKU und das Tag 'Owner'
#   --output table       : Formatierte Tabellenausgabe

az disk list \
  --resource-group $RG \
  --query "[?managedBy==null].{name:name, sizeGB:diskSizeGb, sku:sku.name, owner:tags.Owner}" \
  --output table
