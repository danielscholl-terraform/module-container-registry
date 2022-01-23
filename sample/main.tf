provider "azurerm" {
  features {}
}

module "resource_group" {
  source = "git::https://github.com/danielscholl-terraform/module-resource-group?ref=v1.0.0"

  name     = "iac-terraform"
  location = "eastus2"

  resource_tags = {
    iac = "terraform"
  }
}

module "container_registry" {
  source     = "../"
  depends_on = [module.resource_group]

  name                = substr("iacterraform${module.resource_group.random}", 0, 23)
  resource_group_name = module.resource_group.name

  resource_tags = {
    iac = "terraform"
  }
}
