variable "lista" {
  default = ["a", "a", "b", "c"]
}

output "a1-contains" {
  value = {
    "1 - Na lista": "[${join(",", var.lista)}]",
    "2 - Contem 'a' na lista": contains(var.lista, "a")
    "3 - Não contem 'd' na lista": contains(var.lista, "d")
  }
}

output "b1-distinct" {
  value = {
    "Antes do distict": "[${join(",", var.lista)}]",
    "Depois do distict": "[${join(",", distinct(var.lista))}]"
  }
}

output "c1-element" {
  value = {
    "Primeiro elemento da lista": element(var.lista, 0),
    "Ultimo elemento da lista": element(var.lista, length(var.lista)-1)
  }
}

variable "enable_resource" {
  type    = bool
  default = true
}

resource "null_resource" "example" {
  count = var.enable_resource ? 1 : 0

  provisioner "local-exec" {
    command = "echo teste"
  }
}

output "d1-one" {
  value = one(null_resource.example[*].id)
}
