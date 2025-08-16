resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.subnet_frountend.id
    private_ip_address_allocation = "Dynamic"
  }
}


resource "azurerm_linux_virtual_machine" "vm" {
  name                = var.virtual_machine_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = "Standard_F2"
  admin_username      = data.azurerm_key_vault_secret.data_admin.value
  admin_password      = data.azurerm_key_vault_secret.data_password.value
  disable_password_authentication = false
  network_interface_ids = [
    data.azurerm_network_interface.nic_data.id,
  ]

  
  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts"
    version   = "latest"
  }
  custom_data = base64encode(
    <<-EOF
    #!/bin/bash
    apt-get update
    apt-get install -y nginx
    systemctl enable nginx
    systemctl start nginx
  EOF
  )
}