#!/usr/bin/env bash
# ==============================================================================
# 9. RESSOURCEN-IMPORT: HCL-KONFIGURATION GENERIEREN
# ==============================================================================
# Erzeugt automatisch die HCL-Ressourcendefinition für die importierte VM
# in der Datei generated_vm.tf basierend auf der tatsächlichen Azure-Ressource.

terraform plan -generate-config-out=generated_vm.tf
