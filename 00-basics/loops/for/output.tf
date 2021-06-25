// Retornando uma lista
// [FOR <ITEM> in <LIST> : <OUTPUT>]
output "todos_email" {
  value = [
    for item in var.usuarios :
    item.email
  ]
}

output "admins_email" {
  value = [
    for item in var.usuarios :
    item.email
    if item.admin
  ]
}

// Retornando um dict
// {FOR <KEY>, <VALUE> in <MAP> : <OUTPUT>}
output "format_email" {
  value = {
    for key, val in var.usuarios :
    val.email => {
      "user_name" : key
      "admin" : val.admin
    }
  }
}