rgs = {
  rg1 = {
    name = "priyanshu-rg-prepod"
    loc  = "eastus"
  }
}
vnets = {
  vnet1 = {
    name       = "netflix-vnet-prepod"
    rg         = "priyanshu-rg-prepod"
    loc        = "eastus"
    addr_space = ["10.0.0.0/16"]
  }
}
sub = {
  sub1 = {
    name   = "Backend-subnet"
    rg     = "priyanshu-rg-prepod"
    vnet   = "netflix-vnet-prepod"
    prefix = ["10.0.1.0/24"]
  }
  sub2 = {
    name   = "Frontend-subnet"
    rg     = "priyanshu-rg-prepod"
    vnet   = "netflix-vnet-prepod"
    prefix = ["10.0.2.0/24"]
  }
  sub3 = {
    name   = "AzureBastionSubnet"
    rg     = "priyanshu-rg-prepod"
    vnet   = "netflix-vnet-prepod"
    prefix = ["10.0.3.0/24"]
  }
}
pub = {
  bastion_ip = {
    name  = "Bastions-pip"
    loc   = "eastus"
    rg    = "priyanshu-rg-prepod"
    alloc = "Static"
  }
}

key_vault = {
  kv1 = {
    name       = "kv-preproduction-6557"
    loc        = "eastus"
    rg         = "priyanshu-rg-prepod"
    seceret_name = "adminpassword"
  }
}
virtual_machine = {
  frontend1 = {
    nic_name         = "Frontendvm-nic"
    loc              = "eastus"
    rg               = "priyanshu-rg-prepod"
    sub_name         = "Frontend-subnet"
    vnet_name        = "netflix-vnet-prepod"
    name             = "Frontendvm"
   vm_size = "Standard_B1s"
    username         = "Priyanshulall"
    key_vault_name   = "kv-preproduction-6557"
    key_vault_secret = "adminpassword"
  }
  Backend2 = {
    nic_name         = "Backendvm-nic"
    loc              = "eastus"
    rg               = "priyanshu-rg-prepod"
    sub_name         = "Backend-subnet"
    vnet_name        = "netflix-vnet-prepod"
    name             = "Backendvm"
   vm_size = "Standard_B1s"
    username         = "Priyanshulall"
    key_vault_name   = "kv-preproduction-6557"
    key_vault_secret = "adminpassword"
  }
}
bastions = {
  name           = "linux-bastion"
  bastion_subnet = "AzureBastionSubnet"
  bastion_vnet   = "netflix-vnet-prepod"
  pip    = "Bastions-pip"
  rg             = "priyanshu-rg-prepod"
  loc            = "eastus"
}
