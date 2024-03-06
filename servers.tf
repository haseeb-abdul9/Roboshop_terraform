data "aws_ami" "centOS" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "allow_all" {
  name = "allow all"
}

variable "components" {
  default = {
    frontend ={
      name = "frontend"
      instance_type = "t3.micro"
    }
    mongodb ={
      name = "mongodb"
      instance_type = "t3.micro"
    }
    Catalogue ={
      name = "catalogue"
      instance_type = "t3.micro"
    }
    redis ={
      name = "redis"
      instance_type = "t3.micro"
    }
    user ={
      name = "user"
      instance_type = "t3.micro"
    }
    cart ={
      name = "cart"
      instance_type = "t3.micro"
    }
    mysql ={
      name = "mysql"
      instance_type = "t3.micro"
    }
    shipping ={
      name = "shipping"
      instance_type = "t3.micro"
    }
    rabbitmq ={
      name = "rabbitmq"
      instance_type = "t3.micro"
    }
    payment ={
      name = "payment"
      instance_type = "t3.micro"
    }
    disoatch ={
      name = "dispatch"
      instance_type = "t3.micro"
    }
  }
}


resource "aws_instance" "instance" {
  for_each = var.components
  ami           = data.aws_ami.centOS.image_id
  instance_type = each.value["instance_type"]
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = each.value["name"]
  }
}

resource "aws_route53_record" "records" {
  for_each = var.components
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "${each.value["name"]}-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.instance[each.value["name"]].private_ip]
}
