output "frontdoor_endpoint" {
  value = azurerm_frontdoor.fd.frontend_endpoint[0].host_name
}

output "app_service_default_hostname" {
  value = azurerm_app_service.app.default_site_hostname
}
