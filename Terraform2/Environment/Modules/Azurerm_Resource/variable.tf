variable "resources" {
  type = map(object({
    name = string
    loc  = string
  }))
}
