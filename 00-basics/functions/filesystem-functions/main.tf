output "a1-abspath" {
  value = abspath(path.root)
}

output "b1-dirname" {
  value = dirname("foo/bar/baz.txt")
}

output "c1-file" {
  value = file("${path.module}/backends.tftpl")
}

output "d1-templatefile" {
  value = templatefile("${path.module}/backends.tftpl", { port = 8080, ip_addrs = ["10.0.0.1", "10.0.0.2"] })
}
