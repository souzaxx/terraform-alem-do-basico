variable "usuarios" {
    type = map(object({
            admin = bool
            departamento = string
            email = string
            nome_completo = string
        })
    )
    default = {
        "lucas.souza": {
            "admin" = false
            "departamento" = "devops",
            "email" = "lucas@email.com",
            "nome_completo" = "Lucas de Souza"
        }
        "amanda.carvalho": {
            "admin" = true
            "departamento" = "devops",
            "email" = "amanda@email.com",
            "nome_completo" = "Amanda Soares de Carvalho"
        }
        "paulo.cardoso": {
            "admin" = true
            "departamento" = "data",
            "email" = "paulo@email.com",
            "nome_completo" = "Paulo Cardoso"
        }
    }
}

// [FOR <ITEM> in <LIST> : <OUTPUT>]
output "todos_email" {
    value = [
        for u in var.usuarios:
            u.email
    ]
}

output "admins_email" {
    value = [
        for u in var.usuarios:
            u.email
            if u.admin
    ]
}

// {FOR <KEY>, <VALUE> in <MAP> : <OUTPUT>}
output "format_email" {
    value = {
        for u, v in var.usuarios:
            v.email => {
                "user_name": u
                "admin": v.admin
            }
    }
}