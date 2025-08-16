resource "azurerm_virtual_network" "vnet"{
    name = var.vnet_name
    resource_group_name = var.resource_group_name
    location = var.location
    address_space       = ["10.0.0.0/16"]
}