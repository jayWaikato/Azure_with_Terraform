
resource "azurerm_resource_group" "main" {
  name     = "rg-${var.application_name}-${var.environment_name}"
  location = var.primary_location
}

resource "random_string" "key_string" {
  length  = 6
  upper   = false
  special = false
}

data "azurerm_client_config" "current" {}

data "azurerm_log_analytics_workspace" "observability" {
  name                = "log-observability-dev"
  resource_group_name = "rg-observability-dev"
}

resource "azurerm_key_vault" "main" {
  name                = "kv-${var.application_name}-${var.environment_name}-${random_string.key_string.result}"
  location            = azurerm_resource_group.main.location
  resource_group_name = azurerm_resource_group.main.name
  tenant_id           = data.azurerm_client_config.current.tenant_id
  sku_name            = "standard"
  # rbac_authorization_enabled = true


}

resource "azurerm_role_assignment" "terraform_user" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}

resource "azurerm_monitor_diagnostic_setting" "main" {
  name               = "diag-${var.application_name}-${var.environment_name}-${random_string.key_string.result}"
  target_resource_id = azurerm_key_vault.main.id

  log_analytics_workspace_id = data.azurerm_log_analytics_workspace.observability.id

  enabled_log {
    category_group = "Audit"
  }

  enabled_log {
    category_group = "allLogs"
  }

  enabled_metric {
    category = "AllMetrics"
  }
}
