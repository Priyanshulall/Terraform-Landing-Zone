resource "azurerm_virtual_network" "name" {
  for_each = var.Virtual_Network
  name = each.value.name
  location = each.value.loc
  resource_group_name = each.value.rg
  address_space = each.value.address
}