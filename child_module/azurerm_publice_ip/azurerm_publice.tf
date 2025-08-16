resource "azurerm_public_ip" "pip" {
  name                    = var.public_ip
  location                = var.location
  resource_group_name     = var.resource_group_name
  allocation_method   = "Static"       # ✅ Static required for Standard SKU
  sku                 = "Standard"

}