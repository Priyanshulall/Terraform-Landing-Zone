resource "azurerm_public_ip" "Public" {
  for_each = var.publics
  name = each.value.name
  allocation_method = each.value.allocation
  location = each.value.loc
  resource_group_name = each.value.rg
}