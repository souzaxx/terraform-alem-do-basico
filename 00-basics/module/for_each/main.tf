locals {
  arquivos = {
    "primeiro_arquivo.txt" : "Este é o conteudo do primeiro arquivo",
    "segundo_arquivo.txt" : "Este é o conteudo do segundo arquivo",
  }
}

module "arquivos" {
  source   = "../modules/file"
  for_each = local.arquivos
}
