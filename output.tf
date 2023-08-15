/* output "server-public-ip" {
  value       = aws_instance.activegate.*.public_ip
  description = "Instance PublicIP"
} */

#output "server-public-ip" {
#  value = aws_instance.activegate.public_ip
#  description = "Instance PublicIP"
#}