module "resource_group" {
  source = "../Modules/azurerm_resource_group"
 resource = var.res
}
module "virtual_network" {
    depends_on = [ module.resource_group ]
  source = "../Modules/Azurerm_Virtual_Network"
  Virtual_Network = var.network
}
module "Subnets" {
    depends_on = [ module.resource_group,module.virtual_network ]
    source = "../Modules/Azurerm_Subnet"
    subnets = var.sub
}
module "publicip" {
    depends_on = [ module.resource_group ]
    source = "../Modules/Azurerm_Public_IP"
publics = var.pip
  
}
module "NIC" {
depends_on = [ module.publicip,module.Subnets ]
source = "../Modules/Azurerm_NIC"
  NICs = var.nic
}
module "Virtual_Machine" {
    depends_on = [ module.NIC]
    source = "../Modules/Azurerm_Virtual_Machine"
    virtualMech = var.VMs
    nics = var.nic
}
