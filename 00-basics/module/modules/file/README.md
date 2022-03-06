<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 0.13.1 |
| <a name="requirement_http"></a> [http](#requirement\_http) | >= 2.1.0 |
| <a name="requirement_local"></a> [local](#requirement\_local) | >= 2.1.0 |
| <a name="requirement_random"></a> [random](#requirement\_random) | >= 3.1.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_http"></a> [http](#provider\_http) | >= 2.1.0 |
| <a name="provider_local"></a> [local](#provider\_local) | >= 2.1.0 |
| <a name="provider_random"></a> [random](#provider\_random) | >= 3.1.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [local_file.this](https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file) | resource |
| [random_string.this](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |
| [http_http.this](https://registry.terraform.io/providers/hashicorp/http/latest/docs/data-sources/http) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_content"></a> [content](#input\_content) | Conteúdo do arquivo a ser criado | `any` | `null` | no |
| <a name="input_filename"></a> [filename](#input\_filename) | Nome do arquivo | `string` | `null` | no |
| <a name="input_path"></a> [path](#input\_path) | Caminho completo onde o arquivo será criado | `string` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_filename"></a> [filename](#output\_filename) | Caminho do arquivo criado |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
