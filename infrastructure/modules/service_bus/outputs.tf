output "servicebus_endpoint" {
  value = azurerm_servicebus_namespace.sb_namespace.default_primary_connection_string
  sensitive = true
}