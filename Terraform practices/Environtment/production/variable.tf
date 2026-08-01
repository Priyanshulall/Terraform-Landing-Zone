variable "resource_groups" {
    type = map(any)
}
variable "virtual_networks" {
  type = map(any)
}
variable "subnets" {   
  type = map(any)    
}
variable "key_vaults" {
  type = map(any)    
}
variable "public_ips" {
    type = map(any)
}
variable "VMs" {
    type = map(any)
}
