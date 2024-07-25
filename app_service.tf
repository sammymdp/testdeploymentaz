resource "azurerm_app_service_plan" "asp" {
  name                = "hello-world-asp"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku {
    tier = "Standard"
    size = "S1"
  }
}

resource "azurerm_app_service" "app" {
  name                = "hello-world-app"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  app_service_plan_id = azurerm_app_service_plan.asp.id

  app_settings = {
    "WEBSITES_ENABLE_APP_SERVICE_STORAGE" = "false"
    "DOCKER_REGISTRY_SERVER_URL"          = "https://index.docker.io"
    "DOCKER_REGISTRY_SERVER_USERNAME"     = var.docker_username
    "DOCKER_REGISTRY_SERVER_PASSWORD"     = var.docker_password
    "DOCKER_ENABLE_CI"                    = "true"
  }

  site_config {
    app_command_line = "dotnet HelloWorld.dll"
    always_on        = true
    linux_fx_version = "DOCKER|hello-world:latest"
  }

  identity {
    type = "SystemAssigned"
  }
}
