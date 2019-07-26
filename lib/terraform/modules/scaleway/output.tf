output "private_ip" {
  value = "${scaleway_server.machine.private_ip}"
}

output "public_ip" {
  value = "${scaleway_server.machine.public_ip}"
}