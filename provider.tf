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
  # Configuration options / set VES_P12_PASSWORD= xxxxx
  # https://registry.terraform.io/providers/volterraedge/volterra/latest
   api_p12_file = var.f5_xc_api_p12_file
   url   = var.f5_xc_api_url
}