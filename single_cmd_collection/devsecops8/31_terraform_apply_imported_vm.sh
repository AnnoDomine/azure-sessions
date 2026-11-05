#!/usr/bin/env bash
# ==============================================================================
# 9. RESSOURCEN-IMPORT: IMPORT IN DEN STATE DURCHFÜHREN
# ==============================================================================
# Importiert die Azure VM offiziell in das Terraform State-File und synchronisiert
# die generierte Konfiguration.

terraform apply -auto-approve
