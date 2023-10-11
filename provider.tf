# Sample of configuration : https://github.com/cklewar/f5-xc-modules/tree/main/f5xc



terraform {
  required_providers {
    volterra = {
      source = "volterraedge/volterra"
      version = "0.11.26"
    }
  }
}

provider "volterra" {
  # Configuration options
  # https://registry.terraform.io/providers/volterraedge/volterra/latest
  
}