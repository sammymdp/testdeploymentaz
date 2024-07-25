variable "tenant_id" {
  description = "The Tenant ID for the Azure subscription."
  type        = string
}

resource "azurerm_key_vault" "kv" {
  name                        = "hello-world-kv"
  location                    = azurerm_resource_group.rg.location
  resource_group_name         = azurerm_resource_group.rg.name
  tenant_id                   = var.tenant_id
  sku_name                    = "standard"
  purge_protection_enabled    = true

  network_acls {
    bypass         = "AzureServices"
    default_action = "Deny"
  }
}
