# resource "azurerm_automation_account" "automation_account_example" {
#   name                = "account1"
#   location            = azurerm_resource_group.syslab_rg.location
#   resource_group_name = azurerm_resource_group.syslab_rg.name
#   sku_name            = "Basic"
# }

# # #configuration
# # resource "azurerm_automation_dsc_configuration" "example" {
# #   name                    = "test"
# #   resource_group_name = azurerm_resource_group.syslab_rg.name
# #   automation_account_name = azurerm_automation_account.automation_account_example.name
# #   location            = azurerm_resource_group.syslab_rg.location
# #   content_embedded        = "configuration test {}" #dette er ikke lengre supported i nyeste versjon av azurerm
# # }

# output "dsc-key-test" {
#   description = "The Primary Access Key for the DSC Endpoint associated with this Automation Account."
#   value       = azurerm_automation_account.automation_account_example.dsc_primary_access_key
#   sensitive   = true
# }

# output "dsc-endpoint-test" {
#   description = "The DSC Server Endpoint associated with this Automation Account."
#   value       = azurerm_automation_account.automation_account_example.dsc_server_endpoint
#   sensitive   = true
# }
