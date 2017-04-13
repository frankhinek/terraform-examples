# Configure the Microsoft Azure Provider
provider "azurerm" {
  subscription_id = "${var.arm_subscription_id}"
  client_id       = "${var.arm_client_id}"
  client_secret   = "${var.arm_client_secret}"
  tenant_id       = "${var.arm_tenant_id}"
}

# Create a resource group
resource "azurerm_resource_group" "demo-dev-rg" {
  name          = "demo-dev-rg"
  location      = "${var.azure_location}"
  tags {
    Project     = "Demo"
    Environment = "Development"
  }
}

# Create a network security group
resource "azurerm_network_security_group" "demo-web-nsg" {
  name                         = "demo-web-nsg"
  location                     = "${var.azure_location}"
  resource_group_name          = "${azurerm_resource_group.demo-dev-rg.name}"
  security_rule {
    name                       = "ssh-allow"
    priority                   = 1000
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "TCP"
    source_port_range          = "*"
    source_address_prefix      = "*"
    destination_port_range     = "22"
    destination_address_prefix = "*"
  }
}
