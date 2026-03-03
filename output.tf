output "web_app_hostname" {
  value = azurerm_linux_web_app.app_service.default_hostname
}

output "custom_domain_verification_id" {
  value     = azurerm_linux_web_app.app_service.custom_domain_verification_id
  sensitive = true
}

output "db_url" {
  value = azurerm_private_dns_zone.dns_zone.name
}

output "admin_password" {
  value     = random_password.admin_password.result
  sensitive = true
}
