variable "usuarios" {
    type = map(object({
            email = string
            departamento = string
        })
    )
    default = {
        "Lucas": {
            "email" = "lucassouza@email.com",
            "departamento" = "devops"
        }
        "Amanda": {
            "email" = "amanda@email.com",
            "departamento" = "devops"
        }
    }
}

output "tudo" {
    value = var.usuarios
}

output "amanda" {
    value = var.usuarios["Amanda"]
}

output "email_da_amanda" {
    value = var.usuarios["Amanda"].email
}