#!/usr/bin/env bash
# ==============================================================================
# 9. RESSOURCEN-IMPORT: GENERIERTEN HCL-CODE BEREINIGEN
# ==============================================================================
# Entfernt nicht benötigte bzw. konfliktbehaftete Attribute wie 'platform_fault_domain'
# aus der generierten Konfigurationsdatei.

sed -i '/platform_fault_domain/d' generated_vm.tf
