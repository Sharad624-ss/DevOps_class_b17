data "azurerm_subnet" "subnet_frountend" {
  name                 = var.subnet_name
  virtual_network_name = var.virtual_network_name
  resource_group_name  = var.resource_group_name
}

data "azurerm_network_interface" "nic_data" {
  name                = var.nic_name
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault" "data_key_vault" {
  name                = var.key_vault
  resource_group_name = var.resource_group_name
}

data "azurerm_key_vault_secret" "data_admin" {
  name         = var.key_secret_admin
  key_vault_id = data.azurerm_key_vault.data_key_vault.id
}

data "azurerm_key_vault_secret" "data_password" {
  name         = var.key_secret_password
  key_vault_id = data.azurerm_key_vault.data_key_vault.id
}







