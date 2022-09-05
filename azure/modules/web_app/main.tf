# Create a resource group
resource "azurerm_resource_group" "resource_group" {
  name     = local.resource_name
  location = var.region
}

# To avoid replacement, you need to import the resource:
# terraform import random_password.db_pass securepassword
resource "random_password" "db_pass" {
  length           = 16
  special          = true
  override_special = "_%@"

  lifecycle {
    ignore_changes = [
      length,
      special,
      override_special
    ]
  }
}

resource "random_password" "app_key" {
  length  = 32
  special = true

  lifecycle {
    ignore_changes = [
      length,
      special
    ]
  }
}

resource "random_password" "admin_password" {
  length  = 16
  special = true

  lifecycle {
    ignore_changes = [
      length,
      special
    ]
  }
}
