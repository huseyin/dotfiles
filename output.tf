output "Welcome" {
  value = <<EOT
Hey, you've successfully created a machine. It's time to fun!

Here are informations about the machine:

    Public IP Address: ${scaleway_ip.value.ip}
    SSH command:       ssh root@${scaleway_ip.value.ip}
    SSHCode command:   sshcode root@${scaleway_ip.value.ip}
  EOT
}
