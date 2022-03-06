output "filename" {
  description = "Nome dos arquivos criados pelo modulo"
  value = [
    for f in module.arquivos : f.filename
  ]
}
