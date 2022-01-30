# Modulos

Vamos finalizar os bloquinhos de terraform com o bloquinho do `modules`!

O bloco `module` permite com que a gente repita configurações pré-definidas, criando uma padronização em nossa infra estrutura. O único argumento mandatório do `module` é o `source`, e é com ele que conseguimos definir onde o terraform deve irá buscar o conteúdo do modulo.

Um conceito legal de se falar é que todo código terraform terá ao menos um módulo, e ele é chamado de root module. Portanto, quando você está trabalhando com arquivos .tf em um diretório você está trabalhando no `root module` desse projeto. O terraform permite que você chame outros módulos (e ai que vem o nosso bloquinho module!) e quando isso acontece nos referenciamos a esse recurso como `child module`

### Diferentes tipos de source:
## Local Path
`source = "../modules"`

## Terraform Registry
```
source  = "hashicorp/consul/aws"
version = "0.0.5"
```

## Github + Bitbucket
`source = "github.com/hashicorp/example"`
## Git com uma determinada tag/commit
`source = "git::https://example.com/vpc.git?ref=v1.2.0"`

## Mais tipos:
https://www.terraform.io/language/modules/sources

## Loop no module
Com o lançamento da versão [0.13](https://www.hashicorp.com/blog/announcing-hashicorp-terraform-0-13) o bloquinho do modulo permite a utilização do count e do for_each e do depends_on!!!

## Dicas quando for desenvolver seu modulo
Evite empacotar seu modulo com esses arquvios:

- terraform.tfstate and terraform.tfstate.backup: Esses arquivos contém o estado da sua infraestrutura e esse estado não deveria vir junto com o modulo.
- .terraform: Esse diretório oculto contém modulos e plugins que também não deveriam vir com seu modulo, caso seu código contenha alguma dependencia você deve executar um `terraform init` ao invés de colocar essas dependencias no modulo
- *.tfvars: O seu módulo deve ser o mais genérico possivel, porentanto colocar arquivos .tfvars dentro dele não faz muito sentido.
providers: Evite configurar providers dentro do seu modulo, isso é melhor gerenciado no `root modulo` ao invés do `child module`

Uma ótima documentação para te ajudar a criar o primeiro modulo:
https://learn.hashicorp.com/tutorials/terraform/module-create?in=terraform/modules