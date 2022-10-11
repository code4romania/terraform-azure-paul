# Create App Service plan to define the capacity and resources to be shared among the app services that will be assigned to that plan
resource "azurerm_service_plan" "app_service_plan" {
  name                = local.app_service.name
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  os_type             = "Linux"
  sku_name            = local.app_service.size

  tags = {
    app = var.project_slug
    env = var.env
  }

  depends_on = [
    azurerm_postgresql_flexible_server_database.db
  ]
}

resource "azurerm_linux_web_app" "app_service" {
  name                = local.app_service.name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name
  service_plan_id     = azurerm_service_plan.app_service_plan.id
  https_only          = true

  site_config {
    application_stack {
      docker_image     = local.app_service.docker_image
      docker_image_tag = var.docker_tag
    }

    http2_enabled = true
  }

  app_settings = {
    "DEBUG"                 = var.debug_mode ? "True" : "False"
    "DATABASE_URL"          = "postgres://${local.db_config.admin_db_user}:${local.db_config.admin_db_password}@${azurerm_private_dns_zone.dns_zone.name}/${azurerm_postgresql_flexible_server_database.db.name}"
    "SECRET_KEY"            = random_password.app_key.result
    "DJANGO_ADMIN_USERNAME" = var.admin_email
    "DJANGO_ADMIN_EMAIL"    = var.admin_email
    "DJANGO_ADMIN_PASSWORD" = random_password.admin_password.result

    "CORS_ALLOWED_ORIGINS" = "https://${local.hostname}"
    "FRONTEND_DOMAIN"      = local.hostname
    "ALLOWED_HOSTS"        = local.hostname

    "NO_REPLY_EMAIL"      = var.mail_from_address
    "EMAIL_BACKEND"       = "django.core.mail.backends.smtp.EmailBackend"
    "EMAIL_HOST"          = var.mail_host
    "EMAIL_HOST_USER"     = var.mail_username
    "EMAIL_HOST_PASSWORD" = var.mail_password
    "EMAIL_PORT"          = var.mail_port
    "EMAIL_USE_TLS"       = var.mail_encryption ? "True" : "False"

    "USE_AZURE"          = "True"
    "AZURE_ACCOUNT_NAME" = azurerm_storage_account.storage_account.name
    "AZURE_ACCOUNT_KEY"  = azurerm_storage_account.storage_account.primary_access_key
    "AZURE_CONTAINER"    = azurerm_storage_container.storage_container.name

    "RUN_COLLECT_STATIC" = "yes"
  }

  connection_string {
    name  = "db-connection"
    type  = "PostgreSQL"
    value = azurerm_private_dns_zone.dns_zone.name
  }

  logs {
    application_logs {
      file_system_level = "Warning"
    }

    http_logs {
      file_system {
        retention_in_days = 30
        retention_in_mb   = 35
      }
    }
  }

  tags = {
    app = var.project_slug
    env = var.env
  }
}

resource "azurerm_app_service_custom_hostname_binding" "custom_hostname_binding" {
  count               = var.hostname == null ? 0 : 1
  hostname            = var.hostname
  app_service_name    = azurerm_linux_web_app.app_service.name
  resource_group_name = azurerm_resource_group.resource_group.name
}

resource "azurerm_app_service_managed_certificate" "managed_certificate" {
  count                      = var.hostname == null ? 0 : 1
  custom_hostname_binding_id = azurerm_app_service_custom_hostname_binding.custom_hostname_binding[count.index].id

  tags = {
    app = var.project_slug
    env = var.env
  }

  lifecycle {
    ignore_changes = [
      tags
    ]
  }
}

resource "azurerm_app_service_certificate_binding" "certificate_binding" {
  count               = var.hostname == null ? 0 : 1
  hostname_binding_id = azurerm_app_service_custom_hostname_binding.custom_hostname_binding[count.index].id
  certificate_id      = azurerm_app_service_managed_certificate.managed_certificate[count.index].id
  ssl_state           = "SniEnabled"
}
