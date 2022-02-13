variable "parseint_vars" {
  default = {
    "binário"     = ["1111", 2],
    "decimal"     = ["100", 10],
    "hexadecimal" = ["FF", 16]
  }
}

output "parseint" {
  value = {
    for k,v in var.parseint_vars:
      "Tipo ${k}" => "Era ${v[0]} ficou ${parseint(v[0], v[1])}"
  }
}
