variable "scaleway_organization_key" {}
variable "scaleway_secret_key" {}

variable "machine_name" {
  description = "Specify the machine name"
}

variable "operator" {
  description = "Specify the user name"
}

module "scaleway" {
  source           = "./modules/scaleway"
  organization_key = "${var.scaleway_organization_key}"
  secret_key       = "${var.scaleway_secret_key}"
  name             = "${var.machine_name}"
}

resource "null_resource" "provision" {
  depends_on = ["module.scaleway"]

  connection {
    type         = "ssh"
    user         = "root"
    host         = "${module.scaleway.private_ip}"
    bastion_user = "root"
    bastion_host = "${module.scaleway.public_ip}"
    agent        = true
  }

  provisioner "file" {
    source      = "../../"
    destination = "/tmp"
  }

  provisioner "remote-exec" {
    inline = [
      "bash /tmp/lib/steps/pre.sh"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "export operator=${var.operator}",
      "bash /tmp/lib/steps/provision.sh"
    ]
  }

  provisioner "remote-exec" {
    inline = [
      "bash /tmp/lib/steps/post.sh"
    ]
  }
}

output "welcome" {
  value = <<EOT
Hey, you've successfully created a machine. It's time to fun!
Here are informations about the machine:
    Private IP: ${module.scaleway.private_ip}
    Public IP:  ${module.scaleway.public_ip}
    SSH:        ssh ${var.operator}@${module.scaleway.public_ip}
    SSHCode:    sshcode ${var.operator}@${module.scaleway.public_ip}
  EOT
}
