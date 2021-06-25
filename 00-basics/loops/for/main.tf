variable "usuarios" {
  type = map(object({
    admin         = bool
    departamento  = string
    email         = string
    nome_completo = string
    })
  )
  default = {
    "lucas.souza" : {
      "admin"         = false
      "departamento"  = "devops",
      "email"         = "lucas@email.com",
      "nome_completo" = "Lucas de Souza"
    }
    "amanda.carvalho" : {
      "admin"         = true
      "departamento"  = "devops",
      "email"         = "amanda@email.com",
      "nome_completo" = "Amanda Soares de Carvalho"
    }
    "paulo.cardoso" : {
      "admin"         = true
      "departamento"  = "data",
      "email"         = "paulo@email.com",
      "nome_completo" = "Paulo Cardoso"
    }
  }
}