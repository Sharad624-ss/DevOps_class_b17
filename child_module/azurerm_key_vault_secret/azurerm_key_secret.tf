resource "azurerm_key_vault_secret" "key_secret_name" {
  name         = var.secret_name
  value        = var.key_secret_value
  key_vault_id = data.azurerm_key_vault.key_data.id

  
}


data "azurerm_key_vault" "key_data" {
  name                = var.key_vault_data_name
  resource_group_name = var.resource_group_name
}