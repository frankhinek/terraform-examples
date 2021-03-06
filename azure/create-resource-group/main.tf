# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "${var.arm_subscription_id}"
  client_id       = "${var.arm_client_id}"
  client_secret   = "${var.arm_client_secret}"
  tenant_id       = "${var.arm_tenant_id}"
}

# Create a resource group
resource "azurerm_resource_group" "demo-dev-rg" {
  name     = "demo-dev-rg"
  location = "${var.azure_location}"
  tags {
    Name   = "demo"
  }
}
