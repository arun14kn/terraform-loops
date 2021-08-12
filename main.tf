terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "2.40.0"
    }
  }
}
 
#Azure provider
provider "azurerm" {
  features {}
}
 
# NSG module
module "nsg" {
    count = 4 
    source = "./modules/nsg"
 
    nsgname    = "nsg${count.index}"
    rgname    = "demo10"
    location  = "northeurope"
 
    nsg_rule =[
    {
    name                       = "http"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    },
    {
     name                       = "ssh"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "22"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    }
]
}
