output "a1-jsondecode" {
  value = {
    "json": "{\"hello\": \"world\"}",
    "json-to-hcl": jsondecode("{\"hello\": \"world\"}")
  }
}

output "a2-jsonencode" {
  value = {
    "hcl-to-json": jsonencode({"hello": "world"})
  }
}

