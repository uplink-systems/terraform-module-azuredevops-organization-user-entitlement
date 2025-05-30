####################################################################################################
#   terraform.tf                                                                                   #
####################################################################################################

terraform {
  required_providers {
    azuredevops = {
      source      = "registry.terraform.io/microsoft/azuredevops"
      version     = "~> 1.6"
    }
    azuread = {
      source      = "registry.terraform.io/hashicorp/azuread"
      version     = "~> 3.1"
    }
  }
}
