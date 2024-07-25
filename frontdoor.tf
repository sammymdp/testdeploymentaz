resource "azurerm_frontdoor" "fd" {
  name                = "hello-world-frontdoor"
  resource_group_name = azurerm_resource_group.rg.name

  frontend_endpoint {
    name      = "default"
    host_name = "hello-world.azurefd.net"
  }

  backend_pool {
    name = "default"
    backend {
      address     = azurerm_app_service.app.default_site_hostname
      http_port   = 80
      https_port  = 443
      host_header = azurerm_app_service.app.default_site_hostname
    }
    health_probe_name   = "health-probe"
    load_balancing_name = "load-balancing"
  }

  backend_pool_health_probe {
    name     = "health-probe"
    protocol = "Http"
    path     = "/"
    interval_in_seconds = 30
  }

  backend_pool_load_balancing {
    name                       = "load-balancing"
    sample_size                = 4
    successful_samples_required = 2
  }

  routing_rule {
    name               = "redirect-rule"
    accepted_protocols = ["Https"]
    patterns_to_match  = ["/*"]
    frontend_endpoints = ["default"]
    redirect_configuration {
      redirect_type   = "Found"
      redirect_protocol = "HttpsOnly"
    }
  }
}
