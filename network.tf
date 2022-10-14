# Create the network VNET
resource "azurerm_virtual_network" "app_network" {
  name                = "app-network"
  location            = azurerm_resource_group.syslab_rg.location
  resource_group_name = azurerm_resource_group.syslab_rg.name
  address_space       = [var.network-vnet-cidr]
  depends_on = [
    azurerm_resource_group.syslab_rg
  ]
}

# Create a subnet for VM
resource "azurerm_subnet" "SubnetA" {
  name                 = "SubnetA"
  resource_group_name  = azurerm_resource_group.syslab_rg.name
  virtual_network_name = azurerm_virtual_network.app_network.name
  address_prefixes     = [var.network-subnet-cidr]
  depends_on = [
    azurerm_virtual_network.app_network
  ]
}

# Create Network Card for the Windows VM
resource "azurerm_network_interface" "app_interface" {
  name                = "app-interface"
  location            = azurerm_resource_group.syslab_rg.location
  resource_group_name = azurerm_resource_group.syslab_rg.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.SubnetA.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.app_public_ip.id
  }

  depends_on = [
    azurerm_virtual_network.app_network,
    azurerm_public_ip.app_public_ip,
    azurerm_subnet.SubnetA
  ]
}

# Get a Static Public IP for the Windows VM
resource "azurerm_public_ip" "app_public_ip" {
  name                = "app-public-ip"
  resource_group_name = azurerm_resource_group.syslab_rg.name
  location            = azurerm_resource_group.syslab_rg.location
  allocation_method   = "Static"
  depends_on = [
    azurerm_resource_group.syslab_rg
  ]
}
