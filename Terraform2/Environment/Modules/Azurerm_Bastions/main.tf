resource "azurerm_bastion_host" "bastions" {

  resource_group_name = var.bastion.rg
  name                = var.bastion.name
  location            = var.bastion.loc
  ip_configuration {
    name                 = "Configuration"
    subnet_id            = data.azurerm_subnet.subnet.id
    public_ip_address_id = data.azurerm_public_ip.pip.id
  }
}
