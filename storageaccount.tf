resource "azurerm_storage_account" "storageaccounttest" {
  name                              = "storageaccountexample"
  resource_group_name               = azurerm_resource_group.marksg.name
  location                          = var.location
  account_kind                      = "StorageV2"
  account_tier                      = "Standard"
  account_replication_type          = "RAGRS"
  enable_https_traffic_only         = true

  network_rules {
    default_action                  = "Deny"
    virtual_network_subnet_ids      = local.storage_account_virtual_network_subnet_ids
  }

  tags = var.tags
}
