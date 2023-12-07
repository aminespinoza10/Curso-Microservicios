variable "location" {
  type        = string
  description = "Location for all resources."
}

variable "rg_name" {
  type        = string
  description = "Resource group name for all resources."
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