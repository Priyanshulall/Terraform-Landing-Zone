resource "azurerm_resource_group" "resource" {
  for_each = var.resources
  name     = each.value.name
  location = each.value.loc

}
