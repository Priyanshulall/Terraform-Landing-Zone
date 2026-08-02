resource "azurerm_virtual_network" "vnet" {
    for_each = var.virtual_networks
    name                = each.value.name
    location            = each.value.loc
    resource_group_name = each.value.rg
    address_space       = each.value.address
        
    tags = {
      Environment =  each.value.env
      Service     =  each.value.service
    }

}