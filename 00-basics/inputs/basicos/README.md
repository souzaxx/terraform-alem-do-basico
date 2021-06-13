## Usuando só as variáveis defaults
``` bash
terraform apply
```

## Alterando o valor da _var_ `idade` via linha de comando
``` bash
terraform apply -var="idade=25"
```

## Alterando o valor da _var_ `idade` via variável de ambiente
``` bash
export TF_VAR_idade=21
terraform apply
```

## Utilizando o terraform.tfvars
``` bash
cat > terraform.tfvars <<EOF
pais = "Mexico"
idade = 25
vai_corinthians = true
EOF
```

## Precedencia na atribuição das variáveis

### Ordem que o terraform irá carregar as váriaveis, lembrando que 
- Variáveis de ambiente
- Arquivo terraform.tfvars, se ele existir.
- Arquivo terraform.tfvars.json, se ele existir.
- Arquivos finalizando com *.auto.tfvars ou *.auto.tfvars.json, se houver mais de um arquivo ordem alfabética será levado em conta.
- Argumento -var ou -var-file passado na linha de comando, na ordem que eles foram passados.
