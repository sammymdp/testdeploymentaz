resource "azurerm_log_analytics_workspace" "law" {
  name                = "hello-world-law"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  sku                 = "PerGB2018"
  retention_in_days   = 30
}

resource "azurerm_monitor_diagnostic_setting" "app_diag" {
  name               = "appservice-diagnostics"
  target_resource_id = azurerm_app_service.app.id

  log_analytics_workspace_id = azurerm_log_analytics_workspace.law.id

  log {
    category = "AppServiceHTTPLogs"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 30
    }
  }

  metric {
    category = "AllMetrics"
    enabled  = true
    retention_policy {
      enabled = true
      days    = 30
    }
  }
}
