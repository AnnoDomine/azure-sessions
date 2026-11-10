#!/usr/bin/env bash
# ==============================================================================
# 1. GIT REPOSITORY KLONEN & IN DAS TERRAFORM-VERZEICHNIS WECHSELN
# ==============================================================================
# Klont das Referenz-Repository für Azure Kubernetes Service (AKS) von Cybersteps
# und wechselt in das Arbeitsverzeichnis der Terraform-Konfigurationsdateien.

git clone https://github.com/CyberstepsDE/kubernetes-on-azure.git
cd kubernetes-on-azure/terraform
