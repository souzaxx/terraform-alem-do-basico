terraform {
  required_version = ">= 0.13.1"

  required_providers {
    http = {
      source  = "hashicorp/http"
      version = ">= 2.1.0"
    }
    local = {
      source  = "hashicorp/local"
      version = ">= 2.1.0"
    }
    random = {
      source  = "hashicorp/random"
      version = ">= 3.1.0"
    }
  }
}
