locals {
  namespace     = "${var.project_slug}-${var.env}"
  resource_name = "paul-${local.namespace}"
  hostname      = var.hostname != null ? var.hostname : "paul-${local.app_service.app_name}.azurewebsites.net"

  network = {
    vn_name          = "network-${local.namespace}"
    vn_address_space = ["10.0.0.0/16"]

    subnet_name             = "sn-${local.namespace}"
    subnet_address_prefixes = ["10.0.2.0/24"]
  }

  app_service = {
    plan_name    = "paul-${local.namespace}"
    app_name     = replace("paul-${local.namespace}", "-production$", "")
    docker_image = "code4romania/paul"
    size         = "B1" # Smallest tier but not free, F1 tier didn't allow to apply
  }

  storage_config = {
    name             = "${var.project_slug}${var.env}"
    tier             = "Standard"
    replication_type = "LRS" # Locally Redundant Storage
    container_name   = "data"
  }

  db_config = {
    name              = "db-${local.namespace}"
    sku               = "B_Standard_B1ms"
    version           = "13"
    admin_db_user     = "psqladmin"
    admin_db_password = random_password.db_pass.result

    storage_mb                    = 32768
    backup_retention_days         = 7
    geo_redundant_backup_enabled  = false
    public_network_access_enabled = true
    zone                          = "2"
  }
}
