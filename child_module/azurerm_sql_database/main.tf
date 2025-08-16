resource "azurerm_mssql_database" "sql_database" {
  name         = var.sql_database_name
  server_id    = data.azurerm_mssql_server.data_sql_server.id
  collation    = "SQL_Latin1_General_CP1_CI_AS"
  license_type = "LicenseIncluded"
  max_size_gb  = 2
  sku_name     = "S0"
  enclave_type = "VBS"

  tags = {
    foo = "bar"
  }

  # prevent the possibility of accidental data loss
  lifecycle {
    prevent_destroy = true
  }
}



data "azurerm_mssql_server" "data_sql_server" {
  name                = var.sql_server_name
  resource_group_name = var.resource_group_name

}