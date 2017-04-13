variable "arm_subscription_id"  {}
variable "arm_client_id"        {}
variable "arm_client_secret"    {}
variable "arm_tenant_id"        {}

variable "azure_location" {
  default = "eastus"
  type = "string"
}

variable "vnet_cidr_block" {
  default     = "10.0.0.0/16"
  description = "Block of IP addresses used by the Resource Group. This should not overlap with any other networks, such as a private datacenter connected via ExpressRoute."
  type        = "string"
}
