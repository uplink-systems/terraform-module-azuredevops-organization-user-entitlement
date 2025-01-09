####################################################################################################
#   main.tf                                                                                        #
####################################################################################################

# Add entitlements to all users from the AAD groups with Basic license
module "azuredevops_user_entitlement_basic" {
  source                = "github.com/uplink-systems/terraform-module-azuredevops-organisation-user-entitlement"
  azuread_groups        = ["ADO-Project_01-Basic", "ADO-Project_02-Basic"]
}

# Add entitlements to all users from the AAD groups with Stakeholder license
module "azuredevops_user_entitlement_stakeholder" {
  source                = "github.com/uplink-systems/terraform-module-azuredevops-organisation-user-entitlement"
  azuread_groups        = ["ADO-Project_01-Stakeholder", "ADO-Project_02-Stakeholder"]
  user_entitlement      = {
    account_license_type    = "stakeholder"
  }
}