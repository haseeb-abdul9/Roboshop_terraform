resource "aws_instance" "instance" {
  ami           = data.aws_ami.centOS.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = var.component_name
  }
}

resource "null_resource" "provisioner" {
  depends_on = [aws_instance.instance, aws_route53_record.records]

  provisioner "remote-exec" {
    connection {
      type     = "ssh"
      user     = "centos"
      password = "DevOps321"
      host     = aws_instance.instance.private_ip
    }

    inline = [
      "rm -rf roboshop_shell",
      "git clone https://github.com/haseeb-abdul9/roboshop_shell.git",
      "cd roboshop_shell",
      "sudo bash ${var.component_name}.sh ${var.password}"
    ]
  }
}

resource "aws_route53_record" "records" {
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "${var.component_name}-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.instance.private_ip]
}





