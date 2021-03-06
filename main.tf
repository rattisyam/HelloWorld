variable "location"{
  type = string
}
variable "rgName"{
  type = string
}
variable "client_id" {
  type = string
}
variable "client_secret" {
  type = string
}
variable "subscription_id" {
  type = string
}
variable "tenant_id" {
  type = string
}
terraform {
  backend "azurerm" {
    resource_group_name  = "32943"
    storage_account_name = "cloudlegonewstorage"
    container_name       = "tfstate"
    key                  = "dev.terraform.tfstate"
  }
}
provider "azurerm" {
	 #version = "~>2.0"
	 version = "1.37.0"
	 #features {}
}
resource "azurerm_virtual_network" "example" {
  name                = "virtualNetwork1"
  location            = var.location
  resource_group_name = var.rgName
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  
  subnet {
    name           = "subnet1"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "subnet2"
    address_prefix = "10.0.2.0/24"
  }

  subnet {
    name           = "subnet3"
    address_prefix = "10.0.3.0/24"
    
  }

  tags = {
    environment = "Production"
  }
}
