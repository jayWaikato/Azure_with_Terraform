terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.43.0"
    }

    azuread = {
      source  = "hashicorp/azuread"
      version = "~> 3.5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.7.0"
    }
  }
  backend "azurerm" {}

}

provider "azurerm" {
  features {
    key_vault {
      purge_soft_deleted_secrets_on_destroy = true
      recover_soft_deleted_secrets          = true
    }
  }
}
