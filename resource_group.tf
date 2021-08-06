module "midserver-rg" {
  source                  = "../../modules12/resource_group"
  resource_group_name     = "RGP-${upper(var.location_acronym)}-${upper(var.application_acronym)}-${upper(var.environment_acronym)}"
  resource_group_location = var.location
  
  tags                    = var.tags
}
