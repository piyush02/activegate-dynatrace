/* resource "aws_instance" "activegate" {
  ami                         = "ami-XXXXXXX"
  instance_type               = "t2.medium"
  key_name                    = "tf-test"
  associate_public_ip_address = false
  subnet_id                   = aws_subnet.var.private-1
  #vpc_security_group_ids      = [aws_security_group.ssh-allowed.id]

} */

resource "aws_instance" "activegate" {
  ami = lookup(var.awsprops, "ami")
  instance_type = lookup(var.awsprops, "itype")
  subnet_id = lookup(var.awsprops, "subnet") 
  associate_public_ip_address = lookup(var.awsprops, "publicip")
  key_name = lookup(var.awsprops, "keyname")
  iam_instance_profile = aws_iam_instance_profile.dynatrace_instance_profile.id
  vpc_security_group_ids      = [aws_security_group.ssh-allowed.id]
  user_data                   = templatefile("user_data.tftpl", { tenant_id = var.user_tenant_id, pass_token = var.user_pass_token, api_token = var.user_api_token, my_account_id = var.my_account_id, name = var.name, connection_name = var.connection_name, dt_installer = var.dt_installer })
 /*  user_data                   = <<EOF
#!/bin/bash -xe
sudo  wget  -O Dynatrace-ActiveGate-Linux-x86-1.233.152.sh "https://XXXX.live.dynatrace.com/api/v1/deployment/installer/gateway/unix/latest?arch=x86&flavor=default" --header="Authorization: Api-Token XXXXX"
sudo wget https://ca.dynatrace.com/dt-root.cert.pem ; ( echo 'Content-Type: multipart/signed; protocol="application/x-pkcs7-signature"; micalg="sha-256"; boundary="--SIGNED-INSTALLER"'; echo ; echo ; echo '----SIGNED-INSTALLER' ; cat Dynatrace-ActiveGate-Linux-x86-1.233.152.sh ) | openssl cms -verify -CAfile dt-root.cert.pem > /dev/null
sudo  /bin/sh Dynatrace-ActiveGate-Linux-x86-1.233.152.sh
echo "[aws_monitoring]" >> /var/lib/dynatrace/gateway/config/custom.properties
echo "use_aws_proxy_role = false" >> /var/lib/dynatrace/gateway/config/custom.properties
echo "aws_monitoring_enabled = true" >> /var/lib/dynatrace/gateway/config/custom.properties
sudo systemctl restart dynatracegateway.service
EOF */

  root_block_device {
    delete_on_termination = true
    volume_size = 50
    
  }
  tags = {
    Name = "activeGate-dynatrace"
    application = lookup(var.tags, "application")
    costcenter = lookup(var.tags, "costcenter")
    createdby = lookup(var.tags, "createdby")
    jira = lookup(var.tags, "jira")
  }

}


resource "aws_security_group" "ssh-allowed" {
  #vpc_id = aws_vpc.prod-vpc.id
  vpc_id = lookup(var.awsprops, "vpc")

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = -1
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp" // This means, all ip address are allowed to ssh ! 
    // Do not do it in the production. 
    // Put your office or home address in it!
    cidr_blocks = ["10.0.0.0/24"]
    // self        = true
  } 
}
