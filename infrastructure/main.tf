resource "random_pet" "rg_name" {
  prefix = var.resource_group_name_prefix
}

resource "azurerm_resource_group" "rg" {
  name     = random_pet.rg_name.id
  location = var.resource_group_location
}

module "sql_azure" {
  source         = "./modules/sql_server"
  rg_name        = azurerm_resource_group.rg.name
  location       = azurerm_resource_group.rg.location
  sql_db_name    = var.sql_db_name
  admin_username = var.admin_username
  admin_password = var.admin_password
}

module "storage" {
  source                 = "./modules/storage"
  rg_name                = azurerm_resource_group.rg.name
  location               = azurerm_resource_group.rg.location
  storage_account_name   = var.storage_account_name
  storage_container_name = var.storage_container_name
}

module "service_bus" {
  source            = "./modules/service_bus"
  rg_name           = azurerm_resource_group.rg.name
  location          = azurerm_resource_group.rg.location
  sb_namespace_name = var.sb_namespace_name
}

module "acr" {
  source   = "./modules/acr"
  acr_name = var.acr_name
  rg_name  = azurerm_resource_group.rg.name
  location = azurerm_resource_group.rg.location
}