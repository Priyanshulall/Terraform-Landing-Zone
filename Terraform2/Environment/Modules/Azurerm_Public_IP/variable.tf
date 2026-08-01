variable "public" {
  type = map(object({
    name  = string
    loc   = string
    rg    = string
    alloc = string
  }))
}
