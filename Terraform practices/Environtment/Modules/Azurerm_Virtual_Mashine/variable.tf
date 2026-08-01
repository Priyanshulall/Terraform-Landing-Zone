variable "VMs" {
    type = map(any)
}

variable "custom_data_script" {
  type = string
  default = null
}