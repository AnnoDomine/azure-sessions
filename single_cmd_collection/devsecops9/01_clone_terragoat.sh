#!/usr/bin/env bash
# ==============================================================================
# 1. TERRAGOAT REPOSITORY KLONEN
# ==============================================================================
# Klont das absichtlich verwundbare Terraform-Trainingsrepository TerraGoat
# von Bridgecrew und wechselt in das Azure-Verzeichnis.
# WICHTIG: Diese Infrastruktur dient ausschließlich der statischen Analyse
# und darf NICHT deployed werden!

git clone https://github.com/bridgecrewio/terragoat.git
cd terragoat/terraform/azure
