provider "azurerm" {
  features {}
}

provider "azurerm" {
  alias  = "subscription"
  client_id = var.client_id
  client_secret = var.client_secret
  tenant_id = var.tenant_id
  subscription_id = var.subscription_id
  features {}
}

data "azurerm_client_config" "current" {}
