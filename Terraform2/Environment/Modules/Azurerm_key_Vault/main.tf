data "azurerm_client_config" "current" {
}

output "account_id" {
  value = data.azurerm_client_config.current.client_id
}

resource "azurerm_key_vault" "vault" {
  for_each            = var.vault
  name                = each.value.name
  location            = each.value.loc
  resource_group_name = each.value.rg
  rbac_authorization_enabled = false
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Purge",
      "Recover"
    ]
  }
}
resource "azurerm_key_vault_secret" "secret" {
  for_each     = var.vault
  name         = each.value.seceret_name
  value        = "@Hesoyam-45678"
  key_vault_id = azurerm_key_vault.vault[each.key].id
}
