
resource "azurerm_resource_group" "main" {
  name     = "rg-${var.application_name}-${var.environment_name}"
  location = var.primary_location
}

resource "random_string" "key_string" {
  length  = 6
  upper   = false
  special = false
}

resource "azurerm_key_vault" "main" {
  name                = "kv-${var.application_name}-${var.environment_name}-${random_string.key_string.result}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tenant_id           = "220f5dc3-9452-48e5-9b4f-888df42f7a2d"
  sku_name            = "standard"

}
