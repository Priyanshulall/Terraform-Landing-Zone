resource "azurerm_network_interface" "NICS" {
  for_each            = var.vms
  name                = each.value.nic_name
  resource_group_name = each.value.rg
  location            = each.value.loc
  ip_configuration {
    name                          = "Internal"
    subnet_id                     = data.azurerm_subnet.subnets[each.key].id
    private_ip_address_allocation = "Dynamic"
  }
}

resource "azurerm_linux_virtual_machine" "name" {
  for_each = var.vms 
  
  name                            = each.value.name
  location                        = each.value.loc
  resource_group_name             = each.value.rg
  size                            = each.value.size
  admin_username                  = each.value.username
  admin_password                  = data.azurerm_key_vault_secret.admin_password[each.key].value
  disable_password_authentication = false
  network_interface_ids = [
    azurerm_network_interface.NICS[each.key].id
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
}
