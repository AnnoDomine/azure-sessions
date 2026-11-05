#!/usr/bin/env bash
# ==============================================================================
# 9. RESSOURCEN-IMPORT: IMPORT-BLOCK DEFINIEREN (TERRAFORM 1.5+)
# ==============================================================================
# Schreibt die import.tf mit dem modernen deklarativen import-Block von Terraform.
# Parameter:
#   to = azurerm_linux_virtual_machine.imported_vm : Ziel-Ressourcenadresse im State
#   id = "$VM_ID"                                  : Vollständige Azure Resource ID

cat <<EOF > import.tf
import {
  to = azurerm_linux_virtual_machine.imported_vm
  id = "$VM_ID"
}
EOF
