terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.43.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.7.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "rg-project_hail_marry-dev"
    storage_account_name = "st2ccjbpjoz0"
    container_name       = "tfstate"
    key                  = "devops-dev"
  }

}

provider "azurerm" {
  features {}
  subscription_id = "0fcfc3a4-abe4-4a85-82a8-0d37d2a7e02d"
}
