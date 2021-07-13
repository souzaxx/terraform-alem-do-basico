variable "arquivos" {
  default = {
    arquivo_1 = "Primeiro arquivo",
    arquivo_2 = <<EOF
Esse é o conteudo do
segundo arquivo
EOF
  }
}

resource "local_file" "count_map" {
  count = length(keys(var.arquivos))

  filename = keys(var.arquivos)[count.index]
  content = var.arquivos[keys(var.arquivos)[count.index]]
}
