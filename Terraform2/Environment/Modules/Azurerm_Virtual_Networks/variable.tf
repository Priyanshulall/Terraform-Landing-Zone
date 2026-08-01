variable "virtuals" {
  type = map(object({
    name       = string
    loc        = string
    rg         = string
    addr_space = list(string)
  }))
}
