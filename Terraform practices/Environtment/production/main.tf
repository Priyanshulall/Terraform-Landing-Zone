module "resources" {
    source = "../Modules/Azurerm_Resource_Group"
    resource_groups = var.resource_groups

}
module "vnet" {
    depends_on = [ module.resources ]
    source = "../Modules/Azurerm_Virtual_Network"
    virtual_networks = var.virtual_networks
}
module "subnet" {
    depends_on = [ module.vnet ]
    source = "../Modules/Azurerm_Subnets"
    subnets = var.subnets
}
module "pip" {
    depends_on = [ module.resources ]
    source = "../Modules/Azurerm_Public_Ip"
    public_ips = var.public_ips
}
module "key_vault" {
    depends_on = [ module.resources ]
    source = "../Modules/Azurerm_Key_Vault"
    key_vaults = var.key_vaults
}
module "vm" {
    depends_on = [ module.subnet, module.pip, module.key_vault ]
    source = "../Modules/Azurerm_Virtual_Mashine"
    VMs = var.VMs

}
    
