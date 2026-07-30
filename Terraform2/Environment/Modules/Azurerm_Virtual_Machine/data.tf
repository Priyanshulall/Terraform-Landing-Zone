data "azurerm_subnet" "subnets" {
  for_each             = var.vms
  name                 = each.value.sub_name
  resource_group_name  = each.value.rg
  virtual_network_name = each.value.vnet_name
}

data "azurerm_key_vault" "key_vault" {
  for_each            = var.vms
  name                = each.value.key_vault_name
  resource_group_name = each.value.rg
}
data "azurerm_key_vault_secret" "admin_password" {
  for_each     = var.vms
  name         = each.value.key_vault_secret
  key_vault_id = data.azurerm_key_vault.key_vault[each.key].id

}
