output "sql_password" {
  value = local.admin_password
}

output "sql_username" {
  value = azurerm_mssql_server.server.administrator_login
}

output "sql_server_name" {
  value = azurerm_mssql_server.server.name
}

output "sql_database_name" {
  value = azurerm_mssql_database.db.name
}