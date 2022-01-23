# Module container-registry

A terraform module that provisions and a docker container registry with the following characteristics:

- Ability to enable Admin Level Access.
- Ability to restrict access to subnet segments.


## Usage

```
module "resource_group" {
  source   = "github.com/danielscholl/iac-terraform/modules/resource-group"
  name     = "iac-terraform"
  location = "eastus2"
}

module "container_registry" {
  source              = "../"
  name                = substr("iacterraform${module.resource_group.random}", 0, 23)
  resource_group_name = module.resource_group.name

  resource_tags = {
    iac = "terraform"
  }
}
```

<!--- BEGIN_TF_DOCS --->

<!--- END_TF_DOCS --->
