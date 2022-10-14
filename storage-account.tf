
resource "azurerm_storage_account" "appstore" {
  name                     = "kcsstorageacc2334"
  resource_group_name      = azurerm_resource_group.syslab_rg.name
  location                 = azurerm_resource_group.syslab_rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
  #allow_blob_public_access = true
}

resource "azurerm_storage_container" "data" {
  name                  = "data"
  storage_account_name  = azurerm_storage_account.appstore.name
  container_access_type = "blob"
  depends_on = [
    azurerm_storage_account.appstore
  ]
}

# Here we are uploading our scripts to azure blob
#FirstConfig.ps1
resource "azurerm_storage_blob" "Test-script2" {
  name                   = "FirstConfig.ps1"
  storage_account_name   = azurerm_storage_account.appstore.name
  storage_container_name = azurerm_storage_container.data.name
  type                   = "Block"
  source                 = "./scripts/FirstConfig.ps1"
  depends_on             = [azurerm_storage_container.data]
}


