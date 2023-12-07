resource "azurerm_servicebus_namespace" "sb_namespace" {
  name                = var.sb_namespace_name
  location            = var.location
  resource_group_name = var.rg_name
  sku                 = "Standard"
}

resource "azurerm_servicebus_queue" "sb_queue" {
  name         = "pickage"
  namespace_id = azurerm_servicebus_namespace.sb_namespace.id
}

resource "azurerm_servicebus_topic" "sb_adults_topic" {
  name         = "adultstopic"
  namespace_id = azurerm_servicebus_namespace.sb_namespace.id
}

resource "azurerm_servicebus_topic" "sb_children_topic" {
  name         = "childrentopic"
  namespace_id = azurerm_servicebus_namespace.sb_namespace.id
}

resource "azurerm_servicebus_subscription" "adult_subscription" {
  name               = "S1"
  topic_id           = azurerm_servicebus_topic.sb_adults_topic.id
  max_delivery_count = 1
}

resource "azurerm_servicebus_subscription" "child_subscription" {
  name               = "S1"
  topic_id           = azurerm_servicebus_topic.sb_children_topic.id
  max_delivery_count = 1
}