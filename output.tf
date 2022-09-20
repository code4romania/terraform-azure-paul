output "web_app_hostname" {
  value = module.web_app.web_app_hostname
}

output "custom_domain_verification_id" {
  value     = module.web_app.custom_domain_verification_id
  sensitive = true
}

output "db_url" {
  value = module.web_app.db_url
}

output "admin_password" {
  value     = module.web_app.admin_password
  sensitive = true
}
