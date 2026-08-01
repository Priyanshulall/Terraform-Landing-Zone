data "azurerm_subnet" "subnet" {

  name                 = var.bastion.bastion_subnet
  virtual_network_name = var.bastion.bastion_vnet
  resource_group_name  = var.bastion.rg
}
data "azurerm_public_ip" "pip" {
 
  name                = var.bastion.pip
  resource_group_name = var.bastion.rg
}
