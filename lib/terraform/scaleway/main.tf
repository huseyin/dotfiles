resource "scaleway_server" "machine" {
  name                = "${var.machine_name}"
  image               = "${data.scaleway_image.debian.id}"
  type                = "${var.machine_type}"
  dynamic_ip_required = true

  connection {
    type         = "ssh"
    user         = "root"
    host         = "${self.private_ip}"
    bastion_user = "root"
    bastion_host = "${self.public_ip}"
    agent        = true
  }
}
