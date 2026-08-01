resource "azurerm_network_interface" "nic" {
  for_each            = var.VMs
  name                = each.value.nic_name
  location            = each.value.loc
  resource_group_name = each.value.rg

  ip_configuration {
    name                          = "ipconfig1"
    subnet_id                     = data.azurerm_subnet.subnet[each.key].id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = data.azurerm_public_ip.pip[each.key].id
  }
}
resource "azurerm_linux_virtual_machine" "virtual_machine" {
  for_each                        = var.VMs
  name                            = each.value.name
  resource_group_name             = each.value.rg
  location                        = each.value.loc
  size                            = each.value.size
  admin_username                  = each.value.admin_username
  admin_password                  = data.azurerm_key_vault_secret.admin_password[each.key].value
  disable_password_authentication = false

  network_interface_ids = [
    azurerm_network_interface.nic[each.key].id,
  ]
tags = {
    Environment =  "Dev"
    Service     =  "VirtualMachine"
  } 

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }
  custom_data = base64encode(file("${path.module}/scripts/custom-data.sh"))

  source_image_reference {
    publisher = "Canonical"
    offer     = "0001-com-ubuntu-server-jammy"
    sku       = "22_04-lts-gen2"
    version   = "latest"
  }
}
