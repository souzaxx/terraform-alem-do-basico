variable "estados" {
  type        = list(string)
  default     = [
    "Acre",
    "Alagoas",
    "Amapá",
    "Amazonas",
    "Bahia",
    "Ceará",
    "Distrito Federal",
    "Espírito Santo",
    "Goiás",
    "Maranhão",
    "Mato Grosso do Sul",
    "Mato Grosso",
    "Minas Gerais",
    "Paraná",
    "Paraíba",
    "Pará",
    "Pernambuco",
    "Piauí",
    "Rio Grande do Norte",
    "Rio Grande do Sul",
    "Rio de Janeiro",
    "Rondônia",
    "Roraima",
    "Santa Catarina",
    "Sergipe",
    "São Paulo",
    "Tocantins"
  ]
  description = "Estados Brasileiros"
}

output "primeiro_estado" {
  value       = var.estados[0]
  description = "description"
}

output "ultimo_estado" {
  value       = var.estados[length(var.estados) - 1]
  description = "description"
}
