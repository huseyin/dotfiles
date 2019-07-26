variable "scaleway_organization_key" {}
variable "scaleway_secret_key" {}
variable "machine_name" {}

module "scaleway" {
  source           = "./modules/scaleway"
  organization_key = "${var.scaleway_organization_key}"
  secret_key       = "${var.scaleway_secret_key}"
  name             = "${var.machine_name}"
}

resource "null_resource" "provision" {
  depends_on = ["module.scaleway"]

  connection {
    type  = "ssh"
    host  = "${module.scaleway.public_ip}"
    agent = true
  }

  provisioner "file" {
    source      = "../"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "export operator=op",
      "cd /tmp/terraform",
      "bash bootstrap.sh"
    ]
  }
}
