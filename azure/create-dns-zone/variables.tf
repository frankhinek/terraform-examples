variable "arm_subscription_id"  {}
variable "arm_client_id"        {}
variable "arm_client_secret"    {}
variable "arm_tenant_id"        {}

variable "azure_location" {
  default = "eastus"
  type = "string"
}

variable "dns_zone_name" {
  description = "Domain name to be used for the new DNS zone."
  type        = "string"
}
