output "resource_group_name" {
  value = azurerm_resource_group.rg.name
}

output "sql_server_name" {
  value = module.sql_azure.sql_server_name
}

output "sql_database_name" {
  value = module.sql_azure.sql_database_name
}

output "admin_username" {
  value = module.sql_azure.sql_username
}

output "admin_password" {
  value = module.sql_azure.sql_password
}

output "servicebus_endpoint" {
  value = module.service_bus.servicebus_endpoint
  sensitive = true
}

output "storage_connection_string" {
  value = module.storage.storage_connection_string
  sensitive = true
}

output "acr_name" {
  value = module.acr.acr_name
}

