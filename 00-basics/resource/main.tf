# Veja a doc do recurso em https://registry.terraform.io/providers/hashicorp/local/latest/docs/resources/file
resource "local_file" "primeiro" {
    filename = "./primeiro.txt"
    content     = "primeiro"
}
