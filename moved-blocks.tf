moved {
  from = module.web_app.azurerm_app_service_certificate_binding.certificate_binding[0]
  to   = azurerm_app_service_certificate_binding.certificate_binding[0]
}
moved {
  from = module.web_app.azurerm_app_service_custom_hostname_binding.custom_hostname_binding[0]
  to   = azurerm_app_service_custom_hostname_binding.custom_hostname_binding[0]
}
moved {
  from = module.web_app.azurerm_app_service_managed_certificate.managed_certificate[0]
  to   = azurerm_app_service_managed_certificate.managed_certificate[0]
}
moved {
  from = module.web_app.azurerm_linux_web_app.app_service
  to   = azurerm_linux_web_app.app_service
}
moved {
  from = module.web_app.azurerm_postgresql_flexible_server.db_server
  to   = azurerm_postgresql_flexible_server.db_server
}
moved {
  from = module.web_app.azurerm_postgresql_flexible_server_database.db
  to   = azurerm_postgresql_flexible_server_database.db
}
moved {
  from = module.web_app.azurerm_postgresql_flexible_server_firewall_rule.public_network_access
  to   = azurerm_postgresql_flexible_server_firewall_rule.public_network_access
}
moved {
  from = module.web_app.azurerm_private_dns_zone.dns_zone
  to   = azurerm_private_dns_zone.dns_zone
}
moved {
  from = module.web_app.azurerm_private_dns_zone_virtual_network_link.private_dns_zone_vnet_link
  to   = azurerm_private_dns_zone_virtual_network_link.private_dns_zone_vnet_link
}
moved {
  from = module.web_app.azurerm_resource_group.resource_group
  to   = azurerm_resource_group.resource_group
}
moved {
  from = module.web_app.azurerm_role_assignment.user_role_assigment
  to   = azurerm_role_assignment.user_role_assigment
}
moved {
  from = module.web_app.azurerm_service_plan.app_service_plan
  to   = azurerm_service_plan.app_service_plan
}
moved {
  from = module.web_app.azurerm_storage_account.storage_account
  to   = azurerm_storage_account.storage_account
}
moved {
  from = module.web_app.azurerm_storage_container.storage_container
  to   = azurerm_storage_container.storage_container
}
moved {
  from = module.web_app.azurerm_subnet.subnet
  to   = azurerm_subnet.subnet
}
moved {
  from = module.web_app.azurerm_user_assigned_identity.user_assigned_identity
  to   = azurerm_user_assigned_identity.user_assigned_identity
}
moved {
  from = module.web_app.azurerm_virtual_network.vn_network
  to   = azurerm_virtual_network.vn_network
}
moved {
  from = module.web_app.random_password.admin_password
  to   = random_password.admin_password
}
moved {
  from = module.web_app.random_password.app_key
  to   = random_password.app_key
}
moved {
  from = module.web_app.random_password.db_pass
  to   = random_password.db_pass
}
