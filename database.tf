# Create postgresql database
resource "azurerm_postgresql_flexible_server" "db_server" {
  name                = local.db_config.name
  location            = azurerm_resource_group.resource_group.location
  resource_group_name = azurerm_resource_group.resource_group.name

  sku_name   = local.db_config.sku
  storage_mb = local.db_config.storage_mb

  backup_retention_days        = local.db_config.backup_retention_days
  geo_redundant_backup_enabled = local.db_config.geo_redundant_backup_enabled

  administrator_login    = local.db_config.admin_db_user
  administrator_password = local.db_config.admin_db_password
  version                = local.db_config.version
  zone                   = local.db_config.zone

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    app = var.project_slug
    env = var.env
  }
}

# Manages a PostgreSQL Flexible Server DB
resource "azurerm_postgresql_flexible_server_database" "db" {
  name      = local.db_config.name
  server_id = azurerm_postgresql_flexible_server.db_server.id
  collation = "en_US.utf8"
  charset   = "utf8"

  lifecycle {
    prevent_destroy = true
  }
}

resource "azurerm_postgresql_flexible_server_firewall_rule" "public_network_access" {
  name             = "PublicNetworkAccess"
  server_id        = azurerm_postgresql_flexible_server.db_server.id
  start_ip_address = "0.0.0.0"
  end_ip_address   = "0.0.0.0"
}
