# Loops

Como funciona os loops no terraform?

O terraform utiliza uma linguagem parecida ao do Python na parte do loop
[i.item for i in list]

Nesse teste vamos usar esse exemplo aqui:
{
    "lucas.souza": {
        "admin" = false
        "departamento" = "devops",
        "email" = "lucas@email.com",
        "nome_completo" = "Lucas de Souza"
    }
    "amanda.carvalho": {
        "admin" = true
        "departamento" = "devops",
        "email" = "amanda@email.com",
        "nome_completo" = "Amanda Soares de Carvalho"
    }
    "paulo.cardoso": {
        "admin" = true
        "departamento" = "data",
        "email" = "paulo@email.com",
        "nome_completo" = "Paulo Cardoso"
    }
}

Esse dicionario contém como key o nome do usuário no AD e o seu valor é um outro dicionário com os campos:
- `admin` - Boleano se verdadeiro esse usuário contém super privilégios
- `departamento` - Nome do departamento onde o usuário trabalha
- `email` - Email do usuário
- `nome_completo` - Nome completo do usuário
Essas informações são completamente irrelevante para o nosso exemplo, mas é legal sempre dar um contexto das coisinhas.

<WIP>