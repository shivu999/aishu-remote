resource "azurerm_network_security_group" "bastionnsg" {
  name                = var.environment == "production" ? "bastionnsg" : "${local.common_prefix_nsg}-bastion-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name

  tags                = var.tags

}

resource "azurerm_network_security_group" "spiapp1nsg" {
  name                = var.environment ==  "production" ? "${local.legacy_prefix_nsg}-app1-nsg" : "${local.common_prefix_nsg}-app1-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name

  tags                = var.tags

}

resource "azurerm_network_security_group" "spiappgw1nsg" {
  name                = var.environment ==  "production" ? "${local.legacy_prefix_nsg}-appgw1-nsg" : "${local.common_prefix_nsg}-appgw-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name

  tags                = var.tags

}

resource "azurerm_network_security_group" "spiweb1nsg" {
  name                = var.environment ==  "production" ? "${local.legacy_prefix_nsg}-web1-nsg" : "${local.common_prefix_nsg}-web-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name

  tags                = var.tags

}

resource "azurerm_network_security_group" "spidb1nsg" {
  name                = var.environment ==  "production" ? "${local.legacy_prefix_nsg}-db1-nsg" : "${local.common_prefix_nsg}-db-${var.environment_acronym}"
  location            = azurerm_resource_group.cospivnetrg.location
  resource_group_name = azurerm_resource_group.cospivnetrg.name

  tags                = var.tags

}

resource "azurerm_network_security_group" "rstudionsg" {
  name                = var.environment ==  "production" ? "co-${lower(var.environment_acronym)}-${var.location}-${var.application_rs}-nsg" : "${local.common_prefix_nsg}-rstudio-${var.environment_acronym}"
  location            = azurerm_resource_group.rstudio.location
  resource_group_name = lower(azurerm_resource_group.rstudio.name)

  tags                = var.tags_rs

}

