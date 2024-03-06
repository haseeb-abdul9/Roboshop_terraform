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
      name = "01_frontend"
      instance_type = "t3.micro"
    }
    mongodb ={
      name = "02_mongodb"
      instance_type = "t3.micro"
    }
    Catalogue ={
      name = "03_catalogue"
      instance_type = "t3.micro"
    }
    redis ={
      name = "04_redis"
      instance_type = "t3.micro"
    }
    user ={
      name = "05_user"
      instance_type = "t3.micro"
    }
    cart ={
      name = "06_cart"
      instance_type = "t3.micro"
    }
    mysql ={
      name = "07_mysql"
      instance_type = "t3.micro"
    }
    shipping ={
      name = "08_shipping"
      instance_type = "t3.micro"
    }
    rabbitmq ={
      name = "09_rabbitmq"
      instance_type = "t3.micro"
    }
    payment ={
      name = "10_payment"
      instance_type = "t3.micro"
    }
    disoatch ={
      name = "11_dispatch"
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

resource "aws_route53_record" "frontend" {
  for_each = var.components
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "${each.value["name"]}-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.instance[each.value["name"]].private_ip]
}
