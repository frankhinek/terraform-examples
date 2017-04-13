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

# Create a virtual network
resource "azurerm_virtual_network" "demo-vnet" {
  name                = "demo-vnet"
  address_space       = ["${var.vnet_cidr_block}"]
  location            = "${var.azure_location}"
  resource_group_name = "${azurerm_resource_group.demo-dev-rg.name}"
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

# Create subnet
resource "azurerm_subnet" "web" {
    name                      = "web"
    resource_group_name       = "${azurerm_resource_group.demo-dev-rg.name}"
    virtual_network_name      = "${azurerm_virtual_network.demo-vnet.name}"
    address_prefix            = "${var.subnet_cidr}"
    network_security_group_id = "${azurerm_network_security_group.demo-web-nsg.id}"
}
