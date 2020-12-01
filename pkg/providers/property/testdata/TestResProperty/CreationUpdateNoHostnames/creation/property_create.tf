provider "akamai" {
  edgerc = "~/.edgerc"
  config_section = "afadencloud-example-01"
}

resource "akamai_property" "test" {
  name = var.propertyname
  product_id = var.productid
  contract_id = var.contractid
  group_id= var.groupid
  # Fetch the newly created property
  depends_on = [
    akamai_property.test
  ]
   hostnames = {
    "terraform.provider.myu877.test.net" = "terraform.provider.myu877.test.net.edgesuite.net"
 }
}

variable "groupid" {
  description = "Name of the group associated with this property"
  default = "grp_0"
}

variable "contractid" {
  description = "Contract ID associated with this property"
  default = "ctr_0"
}

variable "productid" {
  description = "Name of the product used to configure this property"
  default = "prd_0"
}

variable "propertyname" {
  description = "Name of the property"
  default = "test property"
}

output "aka_property_name" {
  value = akamai_property.test.name
}

output "aka_property_id" {
  value = akamai_property.test.id
}

output "aka_production_version" {
  value = akamai_property.test.production_version
}

output "aka_staging_version" {
  value = akamai_property.test.staging_version
}
