data "azurerm_client_config" "current" {}

output "tenant_id" {
  value = data.azurerm_client_config.current.tenant_id

}

output "object_id" {
  value = data.azurerm_client_config.current.object_id
}
resource "azurerm_key_vault" "keys" {
  for_each                   = var.key_vaults
  name                       = each.value.name
  location                   = each.value.loc
  resource_group_name        = each.value.rg
  rbac_authorization_enabled = false
  tenant_id                  = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"


  tags = {
    Environment = "Dev"
    Service     = "KeyVault"
  }

  access_policy {
    tenant_id = data.azurerm_client_config.current.tenant_id
    object_id = data.azurerm_client_config.current.object_id

    secret_permissions = [
      "Get",
      "List",
      "Set",
      "Delete",
      "Recover",
        "Backup",
    
    ]
   
  }
   
}
resource "azurerm_key_vault_secret" "secret" {
  for_each     = var.key_vaults
  name         = each.value.secret_name
  value        = "Hesoyam45678"
  key_vault_id = azurerm_key_vault.keys[each.key].id
  tags = {
    Environment = "Dev"
    Service     = "KeyVaultSecret"  
  }

}
