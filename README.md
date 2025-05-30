## Module 'terraform-module-azuredevops-organization-user-entitlement'

### Description

The module manages Azure DevOps user entitlements for the organization following my business needs and standards.  
This includes the following guidelines:  
* Names of Azure DevOps related groups from connected Microsoft Entra directory used to onboard ADO users must start with "ADO-" to be processed.  
  
Some prerequisites needs to be fullfilled to work correctly:  
* The Azure DevOps organisation must already be created and basically pre-configured.  
* The Azure DevOps organisation must already be connected to an Entra ID directory. This is required to use Entra ID based authentication and user enrollment to make use e.g. central user management and securiy feature like IP-based Entra ID conditional access policies.  
* Billing must be configured for Azure DevOps organisations with more than 5 Basic access level users.  

#### How does it work?

Using *azuread_group* data source the module initially gets the attributes for the groups from Azure AD to process. The data source *azuread_user* gets all users attributes for each groups' members. Finally, *azuredevops_user_entitlement* enrolls each Azure AD user into the AzDO organization with at least the default *basic*-license (if not other license is specified).  
Why does the module not make use of AzDO's *Group Rules* feature to enroll users in a smoother and cleaner way? The provider simply does not support this feaure, at least not at the time this module was written.  
Why does the module not make use of *azuredevops_group_entitlement* resources to onboard users? The resource type simply does **not** create/onboard users in the AzDO organization. It only manages licensing on a per-group basis.  
  
Needless to say, but of course the Azure AD **groups** that shall be processed **must already exist** in the connected Microsoft Entra directory.

### Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.10.0 |
| <a name="requirement_azuredevops"></a> [microsoft\/azuredevops](#requirement\_azuredevops) | ~> 1.6 |
| <a name="requirement_azurerm"></a> [hashicorp\/azuread](#requirement\_azuread) | ~> 3.1 |

### Resources

| Name | Type |
|------|------|
| [azuredevops_user_entitlement.user_entitlement](https://registry.terraform.io/providers/microsoft/azuredevops/latest/docs/resources/user_entitlement) | resource |

### Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_user_entitlement"></a> [user\_entitlement](#input\_user\_entitlement) | user_entitlement main variable with resource attributes | <pre>object({<br>  account_license_type = optional(string, "basic")<br>  licensing_source     = optional(string, null)<br>})</pre> | <pre>object({<br>  account_license_type = "basic"<br>})</pre> | no |
| <a name="input_azuread_groups"></a> [azuread\_groups](#input\_azuread\_groups) | groups from connected Azure AD to process | `list(string)` | n/a | yes |

### Outputs

| Name | Description |
|------|-------------|
| <a name="output_user_entitlement"></a> [user\_entitlement](#output\_user\_entitlement) | list of all exported attributes values from the user_entitlement resource |
| <a name="output_user_entitlement_user"></a> [user\_entitlement\_user](#output\_user\_entitlement\_user) | list of user_entitlement resource entitled users' display names |

### Known Issues

Known issues are documented with the GitHub repo's issues functionality. Please filter the issues by **Types** and select **Known Issue** to get the appropriate issues and read the results carefully before using the module to avoid negative impacts on your infrastructure.  
  
<a name="known_issues"></a> [list of Known Issues](https://github.com/uplink-systems/terraform-module-azuredevops-organization-user-entitlement/issues?q=type%3A%22known%20issue%22)
### Sources

This module was thankfully kind of \"forked\", inspired by and customized to my business needs from:  
**[My Tech Ramblings](https://www.mytechramblings.com/posts/automate-azure-devops-setup-using-terraform/)**  
