terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "4.40.0"
    }
  }
  backend "azurerm" {
    resource_group_name  = "DonKoPakadnaNamumkinHai"
    storage_account_name = "mainhoondon"
    container_name       = "gyarahmulkonkipolice"
    key                  = "terraform.tf"

  }
}

provider "azurerm" {
  features {}
  subscription_id = "2e0b9694-0f2b-429c-804f-b3698b528e7c"

}