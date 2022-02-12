# Module Azure Container Registry

A terraform module that provisions and a docker container registry with the following characteristics:

- Ability to enable Admin Level Access.
- Ability to restrict access to subnet segments.


## Usage

```
module "resource_group" {
  source = "git::https://github.com/danielscholl-terraform/module-resource-group?ref=v1.0.0"
  
  name     = "iac-terraform"
  location = "eastus2"
}

module "container_registry" {
  source = "git::https://github.com/danielscholl-terraform/module-container-registry?ref=v1.0.0"
  
  name                = substr("iacterraform${module.resource_group.random}", 0, 23)
  resource_group_name = module.resource_group.name

  resource_tags = {
    iac = "terraform"
  }
}
```

<!--- BEGIN_TF_DOCS --->
## Providers

| Name | Version |
|------|---------|
| azurerm | >= 2.90.0 |
| null | n/a |
| random | n/a |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:-----:|
| is\_admin\_enabled | Specifies whether the admin user is enabled. Defaults to false. | `bool` | `false` | no |
| name | The name of the Container Registry. | `string` | n/a | yes |
| names | Names to be applied to resources (inclusive) | <pre>object({<br>    environment = string<br>    location    = string<br>    product     = string<br>  })</pre> | <pre>{<br>  "environment": "tf",<br>  "location": "eastus2",<br>  "product": "iac"<br>}</pre> | no |
| resource\_group\_name | The name of an existing resource group. | `string` | n/a | yes |
| resource\_ip\_whitelist | A list of IPs and/or IP ranges that should have access to the provisioned container registry | `list(string)` | `[]` | no |
| resource\_tags | Map of tags to apply to taggable resources in this module. By default the taggable resources are tagged with the name defined above and this map is merged in | `map(string)` | `{}` | no |
| sku | The SKU name of the the container registry. Possible values are Basic, Standard and Premium. | `string` | `"Standard"` | no |
| subnet\_id\_whitelist | Represents the subnet IDs that should be allowed to access this resource | `list(string)` | `[]` | no |

## Outputs

| Name | Description |
|------|-------------|
| admin\_password | If admin access is enabled, this will be the password for the ACR |
| admin\_username | If admin access is enabled, this will be the username for the ACR |
| id | The Container Registry ID. |
| name | The name of the azure container registry resource |
| url | The URL that can be used to log into the container registry. |
<!--- END_TF_DOCS --->
