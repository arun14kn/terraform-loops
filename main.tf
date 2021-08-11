terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}
 
provider "azurerm" {
  features {}
}
 
module "storage_account" {
  source    = "./modules/storage-account"
 
  saname    = "arundevcloudops0001"
  rgname    = "demo08"
}
 
module "storage_account2" {
  source    = "./modules/storage-account"
 
  saname    = "arundevcloudops0002"
  rgname    = "demo08"
  location  = "westeurope"
}
