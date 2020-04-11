# Sem dynamic block

Podemos ver no dentro do main.tf que o block de ingress é repetido 4 vezes 

```terraform
ingress {
  description = "Inbound para SSH"
  from_port   = 22
  to_port     = 22
  protocol    = "tcp"
  cidr_blocks = ["127.0.0.1/32"]
}
```

Para aplicar este código:

```shell
terraform init
terraform plan
terraform apply ( lembrando de escrever yes quando o prompt aparecer )
```

Para remover este código:

```shell
terraform destroy -auto-approve
```
