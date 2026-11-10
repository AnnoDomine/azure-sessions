#!/usr/bin/env bash
# ==============================================================================
# 27. AKS-CLUSTERINGRASTRUKTUR MIT TERRAFORM LÖSCHEN (DESTROY)
# ==============================================================================
# Deprovisioniert den durch Terraform erstellten AKS-Cluster und alle
# zugehörigen Cloud-Ressourcen im Verzeichnis 'kubernetes-on-azure/terraform'.

terraform destroy
