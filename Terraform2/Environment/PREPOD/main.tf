module "resources" {
  source    = "../Modules/Azurerm_Resource"
  resources = var.rgs
}
module "vnets" {
  depends_on = [module.resources]
  source     = "../Modules/Azurerm_Virtual_Networks"
  virtuals   = var.vnets
}
module "snets" {
  depends_on = [module.vnets]
  source     = "../Modules/Azurerm_Subnets"
  snets      = var.sub
}
module "publicip" {
  depends_on = [module.resources]
  source     = "../Modules/Azurerm_Public_IP"
  public     = var.pub
}
module "vault" {
    depends_on = [ module.resources ]
    source = "../Modules/Azurerm_key_Vault"
    vault =var.key_vault
}
module "virtualmachine" {
  depends_on = [module.vnets]
  source     = "../Modules/Azurerm_Virtual_Machine"
  vms        = var.virtual_machine
}
module "bastions" {
  depends_on = [module.snets,module.publicip]
  source     = "../Modules/Azurerm_Bastions"
  bastion    = var.bastions
}
