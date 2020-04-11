variable default_ingress {
  type = map(object({description = string, cidr_blocks = list(string)}))
  default = {
    22 = { description = "Inbound para SSH", cidr_blocks = [ "127.0.0.1/32" ] }
    80 = { description = "Inbound para HTTP", cidr_blocks = [ "127.0.0.1/32" ] }
    443 = { description = "Inbound para HTTPS", cidr_blocks = [ "127.0.0.1/32" ] }
    5432 = { description = "Inbound para postgres", cidr_blocks = [ "127.0.0.1/32" ] }
  }
}
