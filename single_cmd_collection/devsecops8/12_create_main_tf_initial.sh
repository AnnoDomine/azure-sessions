#!/usr/bin/env bash
# ==============================================================================
# 4. TERRAFORM-KONFIGURATION MAIN.TF ERSTELLEN (BASIS)
# ==============================================================================
# Erstellt die initiale main.tf mit Provider-Konfiguration (azurerm ~> 3.0.2)
# und der Resource Group Definition.

cat <<EOF > main.tf
# Configure the Azure provider
terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 3.0.2"
    }
  }

  required_version = ">= 1.1.0"
}

provider "azurerm" {
  features {}
}

resource "azurerm_resource_group" "rg" {
  name     = "$RG"
  location = "$REGION"
}
EOF
