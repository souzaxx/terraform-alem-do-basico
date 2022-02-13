output "a1-tobool" {
  value = tobool("true")
}

output "a2-tomap" {
  value = tomap({"a" = 1, "b" = 2})
}

output "a2-toset" {
  value = {
    "[c,b,b]": toset(["c", "b", "b"])
  }
}
