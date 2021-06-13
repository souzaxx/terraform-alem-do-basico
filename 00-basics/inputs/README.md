# Inputs

Você sabe como funcionam as variáveis no terraform?

``` terraform
variable "nome" {
  // Inputs
}
```

O bloquinho de HCL _variables_ é bem simples, mas é sempre bom dar uma analisada por completo.

Pode chamar suas variáveis do jeito que você quiser (mas por favor, dê nomes que façam sentido), excluindo alguns nomes reservados:

`source`, `version`, `providers`, `count`, `for_each`, `lifecycle`, `depends_on`, `locals`

***

## Argumentos

O que pode ter dentro do bloquinho do `variables`?

+ [default](#Default) - Um valor padrão para a variável e, quando usado, transforma a variável em opcional.
+ [type](#Type) - Esse argumento especifica o tipo do valor que essa variável aceita.
+ [description](#Description) - Uma descrição para a variável.
+ [validation](#Validation) - Um bloquinho extra para restringir os valores aceitos por essa variável.
+ [sensitive](#Sensitive) - Limita o output desta variável no stdout.

#### `Default`

Um jeito de você deixar um valor padrão a uma variável, quando você faz isso a sua variável passa de ser uma variável obrigatória, ou seja, você não precisa passar essa variável quando fizer um `terraform apply`, para ser uma variável opcional. Tome cuidado para ver se essa variável pode ser mesmo opcional.

#### `Type`
O `type` permite que você restrinja o tipo da sua variável. Com ele, você consegue forçar que sua variável irá respeitar um tipo pré definido por você. 

``` terraform
variable "idade" {
  type        = number
  default     = 28
  description = "Qual é a sua idade?"
}
```

#### `Description` 
Uma descrição sobre o motivo e como se deve utilizar a sua variável

#### `Validation` 
Mais um mecanismo de restrição para suas variáveis. Se o campo `type` não for o suficiente para proteger o seu sistema de uma variável errada utilize o validation. Esse campo permite que você crie regras para ter certeza que o usuário está passando o valor certo para sua variável.

``` terraform
variable "image_id" {
  type        = string
  description = "The id of the machine image (AMI) to use for the server."

  validation {
    condition     = length(var.image_id) > 4 && substr(var.image_id, 0, 4) == "ami-"
    error_message = "The image_id value must be a valid AMI id, starting with \"ami-\"."
  }
}
```

#### `Condition`

O campo `condition` deve retornar true se o valor for válido, ou falso se for inválido. A condição só pode fazer referência a própria variável, ou seja, não dá para fazer condições usando outras variáveis [melhorar]

Se a condição for falsa o terraform irá retornar um erro com a msg escrita no campo `error_message`

PS: Essa funcionalidade foi adicionada só nas versões superiores ao terraform 0.13.0

#### `Sensitive`

Quando habilitado, o campo `sensitive` previne que essa variável seja mostranda no terraform `plan` ou `apply`, porém a variável ainda será armazenada no terraform.tfstate

---

## Passando valores para as variáveis

Legal, vimos tudo o que podemos configurar no bloquinho do variables, mas como eu posso passar um valor para essa variável?

- [Terraform Cloud](#TFCloud) workspace.
- [Individualmente](#Individualmente), com a opção `-var` na linha de comando.
- [Em arquivos de configuração](#TFVARS) (.tfvars), passando o nome do arquivo na linha de comando ou usando nomes de arquivos padrões (vamos ver isso).
- [Variáveis de ambiente.](#Environments)

#### `TFCloud`
Vamos falar de terraform Cloud No futuro

#### `Individualmente`
Você pode passar as variáveis via linha de comando quando for fazer um terraform apply:
```bash
terraform apply -var="image_id=ami-abc123"
terraform apply -var='image_id_list=["ami-abc123","ami-def456"]' -var="instance_type=t2.micro"
terraform apply -var='image_id_map={"us-east-1":"ami-abc123","us-east-2":"ami-def456"}'
```

#### `TFVARS`
Variable Definitions:
Se quiser passar várias variáveis de uma só vez, você pode fazer isso com o `tfvars`. Você pode nomear esse arquivo como quiser, porém ele deve terminar com `.tfvars` ou `.tfvars.json`.

Para especificar qual arquivo deve ser usado, você pode usar o parâmetro `-var-file` na linha de comando:

```bash
terraform apply -var-file="testing.tfvars"
```

O terraform também pode incluir automaticamente arquivos seguindo essas regras aqui:

- Arquivos chamados `terraform.tfvars` ou `terraform.tfvars.json`
- Qualquer arquivo terminado em `.auto.tfvars` ou `.auto.tfvars.json`

#### `Environments`
Se sua variável não for encontrada em nenhum dos itens acima o terraform irá verificar se existe alguma variável de ambiente em seu processo que tenha a sua variável. A sintaxe dessa variável é `TF_VAR_`

```bash
$ export TF_VAR_image_id=ami-abc123
$ terraform plan
...
```

## Precedência na atribuição das variáveis

### Ordem de precedência que o terraform irá carregar as variáveis, lembrando que a variável será sobrescrita à medida que desce a lista. 
- Variáveis de ambiente
- Arquivo terraform.tfvars, se ele existir.
- Arquivo terraform.tfvars.json, se ele existir.
- Arquivos finalizando com *.auto.tfvars ou *.auto.tfvars.json, se houver mais de um arquivo ordem alfabética será levado em conta.
- Argumento -var ou -var-file passado na linha de comando, na ordem que eles foram passados.


### Referências
https://www.terraform.io/docs/language/values/variables.html
https://learn.hashicorp.com/tutorials/terraform/variables?in=terraform/configuration-language&utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS
https://learn.hashicorp.com/tutorials/terraform/sensitive-variables?in=terraform/configuration-language&utm_source=WEBSITE&utm_medium=WEB_IO&utm_offer=ARTICLE_PAGE&utm_content=DOCS