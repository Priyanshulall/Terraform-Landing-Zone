resource "azurerm_resource_group" "rg" {
  for_each = var.resource_groups
    name     = each.value.name
    location = each.value.loc
    
    tags = {
      Environment =  each.value.env
      Service     =  each.value.service
    }
    lifecycle {
       prevent_destroy = true
    }
}