terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.78.0"
    }
  }

  # backend "azurerm" {
  #   resource_group_name  = "tfsatefile"
  #   storage_account_name = "tfsatefilehimanshuk"
  #   container_name       = "tfstatefile"
  #   key                  = "dev.terraform.tfstate"
  # }
}

provider "azurerm" {
  features {}
}