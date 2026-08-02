resource_groups = {
  rg1 ={
    name = "priyanshu-rg"
    loc ="eastus"
    env = "Dev"
    service = "ResourceGroup"
  }
}
virtual_networks = {
  vnet1 ={
    name = "priyanshu-vnet"
    loc ="eastus"
    rg  = "priyanshu-rg"
    address = ["10.0.0.0/16"]
    env = "Dev"
    service = "VirtualNetwork"  
  }
}
subnets = {
  sub1 ={
    name = "frontend-subnets"
    rg = "priyanshu-rg"
    vnet = "priyanshu-vnet" 
    address = ["10.0.1.0/24"]
  
  }
  sub2={
    name ="Backend-subnet"
    rg = "priyanshu-rg"
    vnet = "priyanshu-vnet"
    address = ["10.0.2.0/24"]
  }
}
public_ips = {
  pip1 ={
    name = "priyanshu-pip"
    loc ="eastus"
    rg  = "priyanshu-rg"
    allocation = "Static"
    env = "Dev"
    service = "PublicIP"
  }
  pip2={
    name = "priyanshu-pip2"
    loc ="eastus"
    rg  = "priyanshu-rg"
    allocation = "Static"
    env = "Dev"
    service = "PublicIP"
  }
}
key_vaults = {
  kv1 ={
    name = "priyanshu-kv"
    loc ="eastus"
    rg  = "priyanshu-rg"
    secret_name = "admin-password"
    env = "Dev"
    service = "KeyVault"
  }
}
VMs = {
  vm1 ={
    name = "priyanshu-vm"
    loc ="eastus"
    rg  = "priyanshu-rg"
    size = "Standard_D2as_V7"
    subnet_name = "frontend-subnets"
    nic_name = "priyanshu-nic"
    vnet_name = "priyanshu-vnet"
    pip_name = "priyanshu-pip"
    kv_name = "priyanshu-kv"
    admin_username = "priyanshu"
    kvsecret_name = "admin-password"
    env = "Dev"
    service = "VirtualMachine"
  }
  vm2 ={
    name = "priyanshu-vm2"
    loc ="eastus"
    rg  = "priyanshu-rg"
    size = "Standard_D2as_V7"
    nic_name = "priyanshu-nic2"
    subnet_name = "Backend-subnet"
    vnet_name = "priyanshu-vnet"
    pip_name = "priyanshu-pip2"
    kv_name = "priyanshu-kv"
    admin_username = "priyanshu"
    kvsecret_name = "admin-password"
    env = "Dev"
    service = "VirtualMachine"
  }
}