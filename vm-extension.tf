
resource "azurerm_virtual_machine_extension" "vm_extension" {
  name                 = "appvm-extension"
  virtual_machine_id   = azurerm_windows_virtual_machine.app_vm.id
  publisher            = "Microsoft.Compute"
  type                 = "CustomScriptExtension"
  type_handler_version = "1.10"
  depends_on = [
    azurerm_storage_blob.Test-script2
  ]

 protected_settings = <<PROTECTED_SETTINGS
    {
        "fileUris": ["https://${azurerm_storage_account.appstore.name}.blob.core.windows.net/data/${azurerm_storage_blob.Test-script2.name}"],
          "commandToExecute": "powershell -ExecutionPolicy Unrestricted -file ${azurerm_storage_blob.Test-script2.name}"     
    }
PROTECTED_SETTINGS
}

#the files gets saved at: C:\Packages\Plugins\Microsoft.Compute.CustomScriptExtension\ inside of the VM










