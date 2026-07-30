variable "snets" {
  type = map(object({
    name       = string
    rg         = string
    vnet       = string
    prefix     = list(string)
  }))
}
