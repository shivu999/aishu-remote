#BastionNSG
resource "azurerm_network_security_rule" "Allow_3389_bstn" {
  name                        = "Allow_3389_bstn"
  priority                    = 101
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "TCP"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefixes     = ["199.207.253.96", "199.207.253.101", "199.206.0.5"]
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.bastionnsg.name
}

resource "azurerm_network_security_rule" "AllStorage" {
  name                        = "AllStorage"
  priority                    = 111
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "Storage"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.bastionnsg.name
}

resource "azurerm_network_security_rule" "Port_8080" {
  name                        = "Port_8080"
  priority                    = 100
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Storage"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.bastionnsg.name
}

#App1NSG
resource "azurerm_network_security_rule" "AllowPrivateWebInBound" {
  name                        = "AllowPrivateWebInBound"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["8080", "8081"]
  source_address_prefix       = var.subnet_address_space_web1
  destination_address_prefix  = var.subnet_address_space_app1
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiapp1nsg.name
}

resource "azurerm_network_security_rule" "AllowVnet3389" {
  name                         = "AllowVnet3389"
  priority                     = 1020
  direction                    = "Inbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "3389"
  source_address_prefix        = "VirtualNetwork"
  destination_address_prefixes = [var.subnet_address_space_app1, "54.163.113.114/32", "54.173.33.56/32", "199.207.253.94","203.199.72.210"]
  resource_group_name          = azurerm_resource_group.cospivnetrg.name
  network_security_group_name  = azurerm_network_security_group.spiapp1nsg.name
}

resource "azurerm_network_security_rule" "AllowMicrosoftOfficeOutBound" {
  name                         = "AllowMicrosoftOfficeOutBound"
  priority                     = 1025
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "443"
  source_address_prefix        = "*"
  destination_address_prefixes = var.MicrosoftOfficeOutBoundIPAddresses
  resource_group_name          = azurerm_resource_group.cospivnetrg.name
  network_security_group_name  = azurerm_network_security_group.spiapp1nsg.name
}

resource "azurerm_network_security_rule" "AllowCarbonBlackOutbound" {
  name                        = "AllowCarbonBlackOutbound"
  priority                    = 1040
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = var.CarbonBlackOutboundIPAddresses
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiapp1nsg.name
}

resource "azurerm_network_security_rule" "AllowQualysOutBound" {
  name                        = "AllowQualysOutBound"
  priority                    = 1050
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = var.QualysOutBoundIPAddresses
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiapp1nsg.name
}

resource "azurerm_network_security_rule" "AllowKpmgSftpOutBound" {
  name                        = "AllowKpmgSftpOutBound"
  priority                    = 1075
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "22"
  source_address_prefix       = "*"
  destination_address_prefix  = var.KpmgSftpOutBoundIpAddresses
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiapp1nsg.name
}

resource "azurerm_network_security_rule" "AllowKPMGSMTP" {
  name                        = "AllowKPMGSMTP"
  priority                    = 1077
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "25"
  destination_port_range      = "25"
  source_address_prefix       = "*"
  destination_address_prefix  = var.KPMGSMTPIPAddresses
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiapp1nsg.name
}

resource "azurerm_network_security_rule" "AllowKpmgHttpsTransferOutBound" {
  name                        = "AllowKpmgHttpsTransferOutBound"
  priority                    = 1080
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = var.KpmgHttpsTransferOutBoundIPAddresses
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiapp1nsg.name
}

resource "azurerm_network_security_rule" "DenyInternetOutBound" {
  name                        = "DenyInternetOutBound"
  priority                    = 2000
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiapp1nsg.name
}

#AppGW1 NSG
resource "azurerm_network_security_rule" "AllowAzureInBound" {
  name                        = "AllowAzureInBound"
  priority                    = 100
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_ranges     = ["65503-65534"]
  source_address_prefix       = "GatewayManager"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiappgw1nsg.name
}

resource "azurerm_network_security_rule" "AllowKpmgInBound" {
  name                        = "AllowKpmgInBound"
  priority                    = 110
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KPMGInboundSourceAddresses
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiappgw1nsg.name
}

resource "azurerm_network_security_rule" "AllowXoriantPune" {
  name                        = "AllowXoriantPune"
  priority                    = 120
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.XoriantPuneIPAddresses
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiappgw1nsg.name
}

resource "azurerm_network_security_rule" "AllowXoriantMumbai" {
  name                        = "AllowXoriantMumbai"
  priority                    = 130
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.XoriantMumbaiIPAddresses
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiappgw1nsg.name
}

resource "azurerm_network_security_rule" "AllowKGSGurgaon" {
  name                        = "AllowKGSGurgaon"
  priority                    = 140
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.KGSGurgaonIPAddresses
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiappgw1nsg.name
}

resource "azurerm_network_security_rule" "AllowKGSBangalore" {
  name                        = "AllowKGSBangalore"
  priority                    = 150
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.KGSBangaloreIPAddresses
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiappgw1nsg.name
}

resource "azurerm_network_security_rule" "AllowPaloAltoUntrustIP" {
  name                        = "AllowPaloAltoUntrustIP"
  description                 = "Allows all traffic coming out of the Palos (Workstation servers) access to the SPI Website"
  priority                    = 160
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefixes     = var.PaloAltoUntrustIPAddresses
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiappgw1nsg.name
}

#DB1 NSG Rules
resource "azurerm_network_security_rule" "AllowVnetSQL" {
  name = "AllowVnetSQL"

  #description                 = "Allows all traffic coming out of the Palos (Workstation servers) access to the SPI Website"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "1113"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = var.subnet_address_space_db1
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spidb1nsg.name
}

resource "azurerm_network_security_rule" "AllowVnetSSAS" {
  name = "AllowVnetSSAS"

  #description                 = "Allows all traffic coming out of the Palos (Workstation servers) access to the SPI Website"
  priority                    = 1020
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "2383"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = var.subnet_address_space_db1
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spidb1nsg.name
}

resource "azurerm_network_security_rule" "AllowVnet3389db1" {
  name = "AllowVnet3389"

  #description                 = "Allows all traffic coming out of the Palos (Workstation servers) access to the SPI Website"
  priority                    = 1040
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = var.subnet_address_space_db1
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spidb1nsg.name
}

resource "azurerm_network_security_rule" "AllowCarbonBlackOutbounddb1" {
  name                        = "AllowCarbonBlackOutbound"
  priority                    = 1040
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = var.CarbonBlackOutboundIPAddresses
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spidb1nsg.name
}

resource "azurerm_network_security_rule" "AllowQualysOutBounddb1" {
  name                        = "AllowQualysOutBound"
  priority                    = 1050
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = var.QualysOutBoundIPAddresses
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spidb1nsg.name
}

resource "azurerm_network_security_rule" "AllowRecoveryServicesOutbound" {
  name                         = "AllowRecoveryServicesOutbound"
  priority                     = 1060
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "*"
  source_address_prefix        = "*"
  destination_address_prefixes = var.RecoveryServicesOutboundIPAddresses
  resource_group_name          = azurerm_resource_group.cospivnetrg.name
  network_security_group_name  = azurerm_network_security_group.spidb1nsg.name
}

resource "azurerm_network_security_rule" "AllowVMExtensionOutBound" {
  name                        = "AllowVMExtensionOutBound"
  priority                    = 1070
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = "Storage"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spidb1nsg.name
}

resource "azurerm_network_security_rule" "AllowAzureSqlBackup" {
  name                         = "AllowAzureSqlBackup"
  priority                     = 1080
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "443"
  source_address_prefix        = "*"
  destination_address_prefixes = var.AzureSqlBackupIPAddresses
  resource_group_name          = azurerm_resource_group.cospivnetrg.name
  network_security_group_name  = azurerm_network_security_group.spidb1nsg.name
}

resource "azurerm_network_security_rule" "DenyInternetOutBounddb1" {
  name                        = "DenyInternetOutBound"
  priority                    = 2000
  direction                   = "Outbound"
  access                      = "Deny"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spidb1nsg.name
}

#Web1NSG

resource "azurerm_network_security_rule" "AllowAppGateway443" {
  name                        = "AllowAppGateway443"
  priority                    = 1000
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = var.subnet_address_space_appgw
  destination_address_prefix  = var.subnet_address_space_web1
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiweb1nsg.name
}

resource "azurerm_network_security_rule" "AllowVnet3389web1" {
  name                        = "AllowVnet3389"
  priority                    = 1020
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "3389"
  source_address_prefix       = "VirtualNetwork"
  destination_address_prefix  = var.subnet_address_space_web1
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiweb1nsg.name
}

resource "azurerm_network_security_rule" "AllowAzureADOutBound" {
  name                         = "AllowAzureADOutBound"
  priority                     = 1000
  direction                    = "Outbound"
  access                       = "Allow"
  protocol                     = "*"
  source_port_range            = "*"
  destination_port_range       = "443"
  source_address_prefix        = "*"
  destination_address_prefixes = var.AzureADOutBoundIPAddresses
  resource_group_name          = azurerm_resource_group.cospivnetrg.name
  network_security_group_name  = azurerm_network_security_group.spiweb1nsg.name
}

resource "azurerm_network_security_rule" "AllowCarbonBlackOutboundweb1" {
  name                        = "AllowCarbonBlackOutbound"
  priority                    = 1040
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = var.CarbonBlackOutboundIPAddresses
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiweb1nsg.name
}

resource "azurerm_network_security_rule" "AllowQualysOutBoundweb1" {
  name                        = "AllowQualysOutBound"
  priority                    = 1050
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "443"
  source_address_prefix       = "*"
  destination_address_prefix  = var.QualysOutBoundIPAddresses
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiweb1nsg.name
}

resource "azurerm_network_security_rule" "DenyInternetOutBoundweb1" {
  name                        = "DenyInternetOutBound"
  priority                    = 2000
  direction                   = "Outbound"
  access                      = "Allow"
  protocol                    = "*"
  source_port_range           = "*"
  destination_port_range      = "*"
  source_address_prefix       = "*"
  destination_address_prefix  = "Internet"
  resource_group_name         = azurerm_resource_group.cospivnetrg.name
  network_security_group_name = azurerm_network_security_group.spiweb1nsg.name
}

