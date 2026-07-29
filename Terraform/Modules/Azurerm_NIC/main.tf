data "azurerm_public_ip" "datapip" {
  for_each            = var.NICs
  name                = each.value.nic_pip
  resource_group_name = each.value.rg
 
}

data "azurerm_subnet" "datasub" {
  for_each             = var.NICs
  name                 = each.value.nic_sub
  resource_group_name  = each.value.rg
  virtual_network_name = each.value.vnet
}
resource "azurerm_network_interface" "name" {
  for_each            = var.NICs
  name                = each.value.name
  resource_group_name = each.value.rg
  location            = each.value.loc
  ip_configuration {
    name                          = "Internal"
    subnet_id                     = data.azurerm_subnet.datasub[each.key].id
    public_ip_address_id          = data.azurerm_public_ip.datapip[each.key].id
    private_ip_address_allocation = "Dynamic"
  }

}