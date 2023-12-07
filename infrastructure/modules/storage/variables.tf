variable "location" {
  type        = string
  description = "Location for all resources."
}

variable "rg_name" {
  type        = string
  description = "Resource group name for all resources."
}

variable "storage_account_name" {
  type        = string
  description = "Storage account name"
}

variable "storage_container_name" {
  type        = string
  description = "Container name where all profile images will be stored"
}