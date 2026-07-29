res = {
  rg={
    name="priyanshu-rg-dev"
    loc ="eastus2"
  }
}

network = {
  vnet={
    name ="Enviornment-Vnet"
    loc ="eastus2"
    rg= "priyanshu-rg"
    address =["10.0.0.0/16"]
  }
}
sub = {
    sub1={
        name="Frontend-subnet"
        rg="priyanshu-rg"
        vnet ="Enviornment-Vnet"
        addr_prefix =["10.0.1.0/24"]
    }
    sub2={
        name ="Backend-subnet"
        rg ="priyanshu-rg"
        vnet="Enviornment-Vnet"
        addr_prefix =["10.0.2.0/24"]
    }
}
pip = {
    public1={
    name= "Frontend-pip"
    rg ="priyanshu-rg"
    allocation ="Static"
    loc ="eastus2"
    }
    public2={
    name= "Backend-pip"
    rg ="priyanshu-rg"
    allocation ="Static"
    loc ="eastus2"
    }
}
nic = {
  nic1 ={
    name= "vm1-Frontend-NIC"
    rg= "priyanshu-rg"
    loc="eastus2"
    nic_pip = "Frontend-pip"
    nic_sub = "Frontend-subnet"
    vnet = "Enviornment-Vnet"

  }
   nic2 ={
    name= "vm2-Backend-NIC"
    rg= "priyanshu-rg"
    loc="eastus2"
    nic_pip = "Backend-pip"
    nic_sub = "Backend-subnet"
    vnet = "Enviornment-Vnet"
  }
}
VMs = {
  vm1={
    name ="VM1-Fronted-Netflix"
    rg = "priyanshu-rg"
    loc=  "eastus2"
    size = "Standard_D2s_v3"
    uname = "priyanshu"
    admin_password = "Hesoyam45678"
    nic = "nic1"
  }
    vm2={
    name ="VM2-Backend-Netflix"
    rg = "priyanshu-rg"
    loc=  "eastus2"
    size = "Standard_D2s_v3"
    uname = "priyanshu"
   admin_password = "ghp_uIu9Y8LzQ7aBc123456789"
    nic = "nic2"
  }
}

