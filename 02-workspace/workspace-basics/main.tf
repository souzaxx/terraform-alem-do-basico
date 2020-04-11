variable ambiente {
  type = map(string)
  description = "Mapa que define em qual ambiente estamos"
  default = {
    default = "Esse é o ambiente padrão"
    dev = "Esse é o ambiente de desenvolvimento"
    hom = "Esse é o ambiente de homologação"
    prod = "Esse é o ambiente de produção"
  }
}

locals {
  exp_env = lookup(var.ambiente, terraform.workspace)
}

output ambiente_atual {
  value = local.exp_env
}
