terraform {
  required_version = ">= 0.13"
  required_providers {
    null = {
      source  = "registry.terraform.io/hashicorp/null"
      version = "~> 3.0"
    }
  }
}
