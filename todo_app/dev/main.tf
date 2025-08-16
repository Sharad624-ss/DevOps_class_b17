module "resource_group" {
  source              = "../../child_module/azurerm_resource_group"
  resource_group_name = "prod-rg-eastus"
  location            = "eastus"
}

module "virtual_network" {
  depends_on          = [module.resource_group]
  source              = "../../child_module/azurerm_virtul_network"
  vnet_name           = "vnet-energy-hub"
  resource_group_name = "prod-rg-eastus"
  location            = "eastus"

}

module "subnet_frountend" {
  depends_on           = [module.virtual_network]
  source               = "../../child_module/azurerm_subnet"
  subnet_name          = "snet-app-prod-frountend"
  resource_group_name  = "prod-rg-eastus"
  virtual_network_name = "vnet-energy-hub"
  address_prefixes     = ["10.0.2.0/24"]
}

module "subnet_backend" {
  depends_on           = [module.virtual_network]
  source               = "../../child_module/azurerm_subnet"
  subnet_name          = "snet-app-prod-backend"
  resource_group_name  = "prod-rg-eastus"
  virtual_network_name = "vnet-energy-hub"
  address_prefixes     = ["10.0.3.0/26"]
}

# module "publice_ip" {
#   depends_on          = [module.resource_group]
#   source              = "../../child_module/azurerm_publice_ip"
#   public_ip           = "pip-web-test"
#   location            = "eastus"
#   resource_group_name = "prod-rg-eastus"
# }

# module "nsg_name" {
#   source              = "../../child_module/azurerm_nsg"
#   nsg_name            = "nsg-hub-prod"
#   location            = "eastus"
#   resource_group_name = "prod-rg-eastus"
# }

# module "vm_frounted" {
#   depends_on = [
#     module.subnet_frountend,
#     module.nsg_name,
#     module.publice_ip,
#     module.key_admin,
#     module.key_password
#   ]
#   source               = "../../child_module/azurerm_virtul_machine"
#   nic_name             = "nic-vm-prod"
#   location             = "eastus"
#   resource_group_name  = "prod-rg-eastus"
#   virtual_machine_name = "frountend-vm"
#   admin_username       = "key-admin-name"
#   subnet_name     = "snet-app-prod-frountend"
#   virtual_network_name = "vnet-energy-hub"
#   key_vault            = "bankingprodvault"
#   key_secret_admin     = "key-admin-name"
#   key_secret_password  = "key-password"
#   nsg_data_name        = "nsg-hub-prod"

# }


# module "vm_backend" {
#   depends_on = [
#     module.subnet_frountend,
#     module.nsg_name,
#     module.publice_ip,
#     module.key_admin,
#     module.key_password
    
#   ]
#   source               = "../../child_module/azurerm_virtul_machine"
#   nic_name             = "nic-vm-prod"
#   location             = "eastus"
#   resource_group_name  = "prod-rg-eastus"
#   virtual_machine_name = "frountend-vm"
#   admin_username       = "key-admin-name"
#   subnet_name     = "snet-app-prod-backend"
#   virtual_network_name = "vnet-energy-hub"
#   key_vault            = "bankingprodvault"
#   key_secret_admin     = "key-admin-name"
#   key_secret_password  = "key-password"
#   nsg_data_name        = "nsg-hub-prod"

# }

# module "key_vault" {
#   depends_on          = [module.resource_group]
#   source              = "../../child_module/azurerm_key_vault"
#   key_vault_name      = "bankingprodvault"
#   location            = "eastus"
#   resource_group_name = "prod-rg-eastus"
# }

# module "key_admin" {
#   depends_on          = [module.key_vault]
#   source              = "../../child_module/azurerm_key_vault_secret"
#   secret_name         = "key-admin-name"
#   resource_group_name = "prod-rg-eastus"
#   key_secret_value    = "sharadsingh"
#   key_vault_data_name = "bankingprodvault"
# }

# module "key_password" {
#   depends_on          = [module.key_vault]
#   source              = "../../child_module/azurerm_key_vault_secret"
#   secret_name         = "key-password"
#   resource_group_name = "prod-rg-eastus"
#   key_secret_value    = "Sharadsingh624@"
#   key_vault_data_name = "bankingprodvault"
# }


# module "sql_server" {
#     depends_on          = [module.key_admin, module.key_password]
#   source              = "../../child_module/azurerm_sql_server"
#   sql_server_name     = "sql-hub-server"
#   resource_group_name = "prod-rg-eastus"
#   location            = "eastus"
#   key_vault           = "bankingprodvault"
#   key_secret_admin    = "key-admin-name"
#   key_secret_password = "key-password"

# }

# module "sql_database" {
#   depends_on          = [module.sql_server]
#   source              = "../../child_module/azurerm_sql_database"
#   sql_database_name   = "sql-hub-database"
#   sql_server_name     = "sql-hub-server"
#   resource_group_name = "prod-rg-eastus"
# }






