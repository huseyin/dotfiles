variable "organization_key" {}
variable "secret_key" {}

variable "region" {
  description = "Specify the region"
  default     = "ams1"
}

variable "machine_name" {
  description = "Specify the machine name"
}

variable "machine_type" {
  description = "Specify the commercial type"
  default     = "DEV1-S"
}

variable "arch" {
  description = "Specify the OS arch for image"
  default     = "x86_64"
}
variable "image" {
  description = "Specify the OS version for image (e.g.: jessie, stretch)"
  default     = "stretch"
}

variable "nodes" {
  description = "Specify the number of nodes"
  default     = 1
}

variable "ssh_key" {
  description = "Specify the SSH key path"
  default     = "~/.ssh/id_rsa"
}

data "scaleway_image" "debian" {
  architecture = "${var.arch}"
  name         = "Debian ${title(var.image)}"
}
