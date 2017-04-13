# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "${var.arm_subscription_id}"
  client_id       = "${var.arm_client_id}"
  client_secret   = "${var.arm_client_secret}"
  tenant_id       = "${var.arm_tenant_id}"
}

# Create a resource group
resource "azurerm_resource_group" "demo_dev_rg" {
  name          = "demo-dev-rg"
  location      = "${var.azure_location}"
  tags {
    Project     = "Demo"
    Environment = "Development"
  }
}

# Create a DNS zone
resource "azurerm_dns_zone" "dns_zone" {
  name                = "${var.dns_zone_name}"
  resource_group_name = "${azurerm_resource_group.demo_dev_rg.name}"
}
