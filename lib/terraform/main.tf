variable "scaleway_organization_key" {}
variable "scaleway_secret_key" {}
variable "scaleway_region" {}
variable "machine_name" {}

provider "scaleway" {
  organization = "${var.scaleway_organization_key}"
  token        = "${var.scaleway_secret_key}"
  region       = "${var.scaleway_region}"
}

module "scaleway" {
  source       = "./lib/terraform/scaleway"
  name = "${mvar.machine_name}"
}
