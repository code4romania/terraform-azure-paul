# Give user access to storage
resource "azurerm_user_assigned_identity" "user_assigned_identity" {
  name                = "user-identity-${var.project_slug}"
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  tags = {
    app = var.project_slug
    env = var.env
  }
}

# and the role assignment to this identity
resource "azurerm_role_assignment" "user_role_assigment" {
  scope                = azurerm_resource_group.resource_group.id
  role_definition_name = "Storage Blob Data Reader"
  principal_id         = azurerm_user_assigned_identity.user_assigned_identity.principal_id
}

resource "azurerm_storage_account" "storage_account" {
  name                     = local.storage_config.name
  resource_group_name      = azurerm_resource_group.resource_group.name
  location                 = azurerm_resource_group.resource_group.location
  account_tier             = local.storage_config.tier
  account_replication_type = local.storage_config.replication_type

  blob_properties {
    cors_rule {
      allowed_origins = [
        "https://${local.hostname}"
      ]

      allowed_methods = [
        "GET", "HEAD"
      ]

      allowed_headers = [
        "Access-Control-Allow-Origin"
      ]

      exposed_headers = [
        "Access-Control-Allow-Origin"
      ]

      max_age_in_seconds = 300
    }
  }

  identity {
    type = "SystemAssigned"
  }

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = local.storage_config.container_name
  storage_account_name  = azurerm_storage_account.storage_account.name
  container_access_type = "blob"

  lifecycle {
    prevent_destroy = true
  }
}
