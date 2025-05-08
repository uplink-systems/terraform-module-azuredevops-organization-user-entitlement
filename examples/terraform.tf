#################################################################################################### 
#   terraform.tf                                                                                   # 
####################################################################################################

terraform {
  required_version = "~> 1.10.0"
  required_providers {
    azuredevops = {
      source = "microsoft/azuredevops"
      version = "~> 1.6"
    }
    azuread = {
      source      = "hashicorp/azuread"
      version     = "~> 3.1"
    }
  }
}
