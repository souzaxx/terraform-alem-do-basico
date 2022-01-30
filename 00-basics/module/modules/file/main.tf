locals {
  filename = var.filename != null ? var.filename : random_string.default_filename.id
  content  = var.content != null ? var.content : data.http.default_content.body
  path     = var.path != null ? var.path : path.root
}

resource "random_string" "default_filename" {
  length  = 8
  special = false
  upper   = false
  number  = false
}

data "http" "default_content" {
  url = "https://baconipsum.com/api/?type=meat-and-filler"

  request_headers = {
    Accept = "application/json"
  }
}

resource "local_file" "this" {
  filename = "${local.path}/${local.filename}"
  content  = local.content
}

