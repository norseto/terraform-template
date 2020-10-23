data "azurerm_resource_group" "this" {
  name = var.backend_rgname
}

resource "azurerm_storage_account" "this" {
  name                     = var.backend_acctname
  resource_group_name      = var.backend_rgname
  location                 = data.azurerm_resource_group.this.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
}

resource "azurerm_storage_container" "this" {
  name                 = var.backend_containername
  storage_account_name = azurerm_storage_account.this.name
}
