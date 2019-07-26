provider "scaleway" {
  organization = "${var.organization_key}"
  token        = "${var.secret_key}"
  region       = "${var.region}"
}

resource "scaleway_server" "machine" {
  name                = "${var.name}"
  image               = "${data.scaleway_image.debian.id}"
  type                = "${var.type}"
  dynamic_ip_required = true
}
