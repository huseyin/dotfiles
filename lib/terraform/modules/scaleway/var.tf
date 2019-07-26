variable "organization_key" {}
variable "secret_key" {}

variable "name" {
  description = "Specify the machine name"
}

variable "type" {
  description = "Specify the commercial type"
  default     = "DEV1-S"
}

variable "region" {
  description = "Specify the region"
  default     = "ams1"
}

variable "arch" {
  description = "Specify the OS arch"
  default     = "x86_64"
}

variable "debian_version" {
  description = "Specify the Debian version (e.g.: jessie, stretch)"
  default     = "stretch"
}

data "scaleway_image" "debian" {
  architecture = "${var.arch}"
  name         = "Debian ${title(var.debian_version)}"
}
