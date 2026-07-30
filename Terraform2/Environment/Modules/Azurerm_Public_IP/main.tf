resource "azurerm_public_ip" "pip" {
  for_each            = var.public
  name                = each.value.name
  location            = each.value.loc
  resource_group_name = each.value.rg
  allocation_method   = each.value.alloc
}
