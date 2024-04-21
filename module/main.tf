resource "aws_instance" "instance" {
  ami           = data.aws_ami.centOS.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = local.Name
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

    inline = var.server_type == "db" ? local.db_commands : local.app_commands
  }
}

resource "aws_route53_record" "records" {
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "${var.component_name}-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.instance.private_ip]
}

resource "aws_iam_role" "role" {
  name = "${var.component_name}-${var.env}-role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    tag-key = "${var.component_name}-${var.env}-role"
  }
}




