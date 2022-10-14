resource "azurerm_windows_virtual_machine" "app_vm" {
  #name                = "appvm"
  name                = "GUI-test"
  resource_group_name = azurerm_resource_group.syslab_rg.name
  location            = azurerm_resource_group.syslab_rg.location
  size                = "Standard_B2s"
  
  #availability_set_id   = azurerm_availability_set.app_set.id
  network_interface_ids = [azurerm_network_interface.app_interface.id]

  computer_name  = "windows-vm"
  admin_username = "tfadmin"
  admin_password = "Pa$$word!"

  os_disk {
    name                 = "windows-vm-os-disk"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2019-Datacenter"
    version   = "latest"
  }

  depends_on = [
    azurerm_network_interface.app_interface,
    #azurerm_availability_set.app_set
  ]

  enable_automatic_updates = true
  provision_vm_agent       = true
}

resource "azurerm_availability_set" "app_set_test" {
  name                         = "app-set-test"
  location                     = azurerm_resource_group.syslab_rg.location
  resource_group_name          = azurerm_resource_group.syslab_rg.name
  platform_fault_domain_count  = 3
  platform_update_domain_count = 3
  depends_on = [
    azurerm_resource_group.syslab_rg
  ]
}

