variable "resource_group_location" {
  type        = string
  description = "Location for all resources."
}

variable "resource_group_name_prefix" {
  type        = string
  description = "Prefix of the resource group name that's combined with a random ID so name is unique in your Azure subscription."
}

variable "sql_db_name" {
  type        = string
  description = "The name of the SQL Database."
}

variable "admin_username" {
  type        = string
  description = "The administrator username of the SQL logical server."
  default     = "azureadmin"
}

variable "admin_password" {
  type        = string
  description = "The administrator password of the SQL logical server."
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name"
}

variable "storage_container_name" {
  type        = string
  description = "Container name where all profile images will be stored"
}

variable "sb_namespace_name" {
  type        = string
  description = "Service bus namespace name"
}

variable "acr_name" {
  type        = string
  description = "ACR name."
}