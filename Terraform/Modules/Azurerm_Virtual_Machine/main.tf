resource "azurerm_linux_virtual_machine" "Virtual_Machine" {
 for_each = var.virtualMech
  name                = each.value.name
  resource_group_name = each.value.rg
  location            = each.value.loc
  size                = each.value.size

  admin_username      = each.value.uname
  admin_password      = each.value.admin_password
 disable_password_authentication = false

  network_interface_ids = [
    data.azurerm_network_interface.Interface[each.value.nic].id
  ]


  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       =  "22_04-lts-gen2"
    version   = "latest"
  }
}
data "azurerm_network_interface" "Interface" {
    for_each = var.nics
  name                = each.value.name
  resource_group_name = each.value.rg
}