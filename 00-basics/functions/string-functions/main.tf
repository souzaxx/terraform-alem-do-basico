variable "chomp_vars" {
  default = "    Uma string com novas linhas \r\n\n"
}

output "a1-chomp" {
  value = {
    "Sem chomp": var.chomp_vars,
    "Com chomp": chomp(var.chomp_vars)
  }
}

output "a2-trimspace" {
  value = {
    "Sem trimspace": var.chomp_vars,
    "Com trimspace": trimspace(var.chomp_vars)
  }
}

output "b1-format" {
  value = {
    "simples": format("Olá %s", "Lucas")
    "zero a esquerda": format("%02s", 2)
  }
}

variable "lista_simples" {
  default = [
    "primeiro",
    "segundo",
    "terceiro"
  ]
}

output "c1-join" {
  value = {
    "URL": join(".",["www","souzaxx","net"])
    "lista-para-string-lista": "[${join(",", var.lista_simples)}]",
    "lista-para-string-lista-jsonencode": jsonencode(var.lista_simples),
    "lista-para-traço": join("-", var.lista_simples),
  }
}

output "c2-split" {
  value = {
    "virgula-para-lista" = split(",", "primeiro,segundo,terceiro"),
    "website-para-lista" = split(".", "www.souzaxx.net")
  }
}

output "c3-regex" {
  value =  regex("^(?:(?P<scheme>[^:/?#]+):)?(?://(?P<authority>[^/?#]*))?", "https://terraform.io/docs/")
}

output "c4-replace" {
  value = replace("Olá mundo!", "/m.*o/", "pessoal")
}

output "c5-trimprefix" {
  value = trimprefix("https://terraform.io", "https://")
}
