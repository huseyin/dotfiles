provider "scaleway" {
  organization = "${var.organization_key}"
  token        = "${var.secret_key}"
  region       = "${var.region}"
}

resource "scaleway_server" "machine" {
  name  = "${var.machine_name}"
  image = "${data.scaleway_image.debian.id}"
  type  = "${var.machine_type}"
}

resource "scaleway_ip" "value" {
  server = "${scaleway_server.machine.id}"
}
