resource "azurerm_application_gateway" "application_gateway" {
    for_each = var.application_gateway
  name                = each.value.name
  resource_group_name = each.value.resource_group
  location            = each.value.location
  
  sku {
    name     = each.value.sku_name
    tier     = each.value.sku_tier
    capacity = each.value.sku_capacity
  }

  gateway_ip_configuration {
    name      = "appGatewayIpConfig"
    subnet_id = var.subnet_id[each.value.subnet_key]
  }

  frontend_port {
    name = "frontendPort"
    port = each.value.frontend_port
  }

  frontend_ip_configuration {
    name                 = "frontendIpConfig"
    public_ip_address_id = var.public_ip_address_id[each.value.public_ip_key]
  }

  backend_address_pool {
    name = "backendAddressPool"

    ip_addresses = [ 
      for vm_ip in each.value.nic_private_ip_key :
        var.private_ip_value[vm_ip]
     ]
  }

  backend_http_settings {
    name                  = "backendHttpSettings"
    cookie_based_affinity = "Disabled"
    port                  = each.value.backend_port
    protocol              = "Http"
    request_timeout       = 20
  }

  http_listener {
    name                           = "httpListener"
    frontend_ip_configuration_name = "frontendIpConfig"
    frontend_port_name             = "frontendPort"
    protocol                       = "Http"
  }

  request_routing_rule {
  name                       = "requestRoutingRule"
  priority                   = 100
  rule_type                  = "Basic"

  http_listener_name         = "httpListener"

  backend_address_pool_name  = "backendAddressPool"
  backend_http_settings_name = "backendHttpSettings"
}
  
}