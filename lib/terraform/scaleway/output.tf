output "Welcome" {
  value = <<EOT
Hey, you've successfully created a machine. It's time to fun!

Here are informations about the machine:

    Public IP:       ${scaleway_server.machine.public_ip}
    Private IP:      ${scaleway_server.machine.private_ip}
    SSH command:     ssh ${var.user}@${scaleway_server.machine.public_ip}
    SSHCode command: sshcode ${var.user}@${scaleway_server.machine.public_ip}
  EOT
}
