output "vnet_id" {
  value = module.vnet-main.vnet_id
}

output "storage_account_name" {
  value = azurerm_storage_account.sa.name
}

output "resource_group_name" {
  value = azurerm_resource_group.setup.name
}
