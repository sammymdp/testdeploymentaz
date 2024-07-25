resource "azurerm_resource_group" "rg" {
  name     = "hello-world-rg"
  location = var.location
}
