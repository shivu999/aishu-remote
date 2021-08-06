resource "azurerm_network_security_rule" "midserver-in-deny" {
  name                        = "midserver-in-deny"
  priority                    = 900
  direction                   = "Inbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.midserver-rg.resource_group_name
  network_security_group_name = module.midserver-nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "midserver-out-deny" {
  name                        = "midserver-out-deny"
  priority                    = 900
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = module.midserver-rg.resource_group_name
  network_security_group_name = module.midserver-nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "midserver-in-rdp-allow" {
  name                        = "midserver-in-rdp-allow"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = [var.mgmt_subnet_address_space]
  destination_address_prefix  = "*"
  resource_group_name         = module.midserver-rg.resource_group_name
  network_security_group_name = module.midserver-nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "midserver-in-winrm-allow" {
  name                        = "midserver-in-winrm-allow"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "5985-5986"
  source_address_prefixes     = [var.mgmt_subnet_address_space]
  destination_address_prefix  = "*"
  resource_group_name         = module.midserver-rg.resource_group_name
  network_security_group_name = module.midserver-nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "midserver-in-ssl-allow" {
  name                        = "midserver-in-ssl-allow"
  priority                    = 140
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = [var.mgmt_subnet_address_space]
  destination_address_prefix  = "*"
  resource_group_name         = module.midserver-rg.resource_group_name
  network_security_group_name = module.midserver-nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "midserver-out-adds-allow" {
  name                        = "midserver-out-adds-allow"
  priority                    = 120
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = var.ad_subnet_address_space
  resource_group_name         = module.midserver-rg.resource_group_name
  network_security_group_name = module.midserver-nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "midserver-out-carbon-black-allow" {
  name                         = "midserver-out-carbon-black-allow"
  priority                     = 130
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "443"
  source_address_prefix        = "*"
  destination_address_prefixes = ["199.207.144.0/26", "199.206.132.0/24"]
  resource_group_name          = module.midserver-rg.resource_group_name
  network_security_group_name  = module.midserver-nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "midserver-out-qualys-allow" {
  name                         = "midserver-out-qualys-allow"
  priority                     = 140
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "443"
  source_address_prefix        = "*"
  destination_address_prefixes = ["64.39.96.0/20"]
  resource_group_name          = module.midserver-rg.resource_group_name
  network_security_group_name  = module.midserver-nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "midserver-out-vnet-allow" {
  name                        = "midserver-out-vnet-allow"
  priority                    = 150
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "VirtualNetwork"
  resource_group_name         = module.midserver-rg.resource_group_name
  network_security_group_name = module.midserver-nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "midserver-out-ssl-internet-allow" {
  name                        = "midserver-out-ssl-internet-allow"
  priority                    = 160
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = module.midserver-rg.resource_group_name
  network_security_group_name = module.midserver-nsg.network_security_group_name
}

resource "azurerm_network_security_rule" "midserver-out-activation-allow" {
  name                   = "midserver-out-activation-allow"
  priority               = 170
  direction              = "Outbound"
  access                 = "Allow"
  protocol               = "*"
  source_port_range      = "*"
  destination_port_range = "1688"
  source_address_prefix  = "*"
  destination_address_prefixes = [
    "23.97.0.13/32",
    "23.102.135.246/32"
  ]
  resource_group_name         = module.midserver-rg.resource_group_name
  network_security_group_name = module.midserver-nsg.network_security_group_name
}

