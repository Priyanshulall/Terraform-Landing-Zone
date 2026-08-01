data "azurerm_subnet" "subnet" {
    for_each = var.VMs
    name                 = each.value.subnet_name
    virtual_network_name = each.value.vnet_name
    resource_group_name  = each.value.rg    
}

data "azurerm_public_ip" "pip" {
    for_each = var.VMs
    name                 = each.value.pip_name
    resource_group_name  = each.value.rg    
}
data "azurerm_key_vault" "kv" {
    for_each = var.VMs
    name                 = each.value.kv_name
    resource_group_name  = each.value.rg    
}
data "azurerm_key_vault_secret" "admin_password" {
    for_each = var.VMs
    name         = each.value.kvsecret_name
    key_vault_id = data.azurerm_key_vault.kv[each.key].id
}