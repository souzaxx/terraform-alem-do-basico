# Com dynamic block

Já neste exemplo os 4 blocos de ingress são substituídos por um dynamic block

```terraform
dynamic "ingress" {
  for_each = var.default_ingress
  content {
    description = ingress.value["description"]
    from_port   = ingress.key
    to_port     = ingress.key
    protocol    = "tcp"
    cidr_blocks = ingress.value["cidr_blocks"]
  }
}
```

Lembrando que neste exemplo a variável **default_ingress** será usada no nosso loop. Esta variável é do tipo mapa e será inteirada dentro do loop for_each.

```
  22 = { description = "Inbound para SSH", cidr_blocks = [ "127.0.0.1/32" ] }
  80 = { description = "Inbound para HTTP", cidr_blocks = [ "127.0.0.1/32" ] }
  443 = { description = "Inbound para HTTPS", cidr_blocks = [ "127.0.0.1/32" ] }
  5432 = { description = "Inbound para postgres", cidr_blocks = [ "127.0.0.1/32" ] }
```

Algo legal para ser lembrado é que quando estamos dentro do dynamic block e queremos acessar algum valor dessa variável usada no for_each devemos usar o local_name do dynamic block. Ou seja, se nosso dynamic block irá se chamar "ingress" podemos acessar as keys desse mapa com "ingress.key" e o valor dessa chave com "ingress.value". As vezes o for_each faz mais sentido se levarmos ele para um estilo mais pythonesco:

``` for ingress in var.default_ingress ```

Para aplicar este código:

```shell
terraform init
terraform plan
terraform apply ( lembrando de escrever yes quando o prompt aparecer 
```

Lembrando que este exemplo contém remote-state, o qual será referenciado no exemplo [workspace-ec2](../../02-workspace/workspace-ec2). Portanto, não destruia esse exemplo antes de testar o workspace-ec2.

Para remover este código:

```shell
terraform destroy -auto-approve
```

