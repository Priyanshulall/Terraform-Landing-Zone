resource "azurerm_public_ip" "pip" {
    for_each = var.public_ips
    name                = each.value.name
    location            = each.value.loc
    resource_group_name = each.value.rg
    allocation_method   = each.value.allocation
    
    tags = {
      Environment =  each.value.env
      Service     =  each.value.service
    }   
    lifecycle {
       create_before_destroy = true
    }
  
}