#!/usr/bin/env bash
# ==============================================================================
# 8. KONFIGURATIONSERWEITERUNG: TAGS & VIRTUAL NETWORK
# ==============================================================================
# Aktualisiert main.tf: Ergänzt Tags an der Resource Group und deklariert ein
# neues Virtual Network (azurerm_virtual_network).

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

  tags = {
    Environment = "Terraform Getting Started"
    Team        = "Cybersteps"
  }
}

resource "azurerm_virtual_network" "vnet" {
  name                = "$VNET"
  address_space       = ["10.0.0.0/16"]
  location            = "$REGION"
  resource_group_name = azurerm_resource_group.rg.name
}
EOF
