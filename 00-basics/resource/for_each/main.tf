variable "arquivos" {
  default = {
    arquivo_1 = "Primeiro arquivo",
    arquivo_2 = <<EOF
Esse é o conteudo do
segundo arquivo
EOF
  }
}

resource "local_file" "for_each" {
  for_each = var.arquivos

  filename = each.key
  content = each.value
}
