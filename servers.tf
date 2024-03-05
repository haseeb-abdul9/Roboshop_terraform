data "aws_ami" "centOS" {
  owners      = ["973714476881"]
  most_recent = true
  name_regex  = "Centos-8-DevOps-Practice"
}

data "aws_security_group" "allow_all" {
  name = "allow all"
}

variable "instance_type" {
  default = "t3.micro"
}

resource "aws_instance" "frontend" {
  ami           = data.aws_ami.centOS.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "01_frontend"
  }
}

resource "aws_route53_record" "frontend" {
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "frontend-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.frontend.public_ip]
}

resource "aws_instance" "mongodb" {
  ami           = data.aws_ami.centOS.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "02_mongodb"
  }
}

resource "aws_route53_record" "mongodb" {
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "mongodb-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.mongodb.public_ip]
}

resource "aws_instance" "catalogue" {
  ami           = data.aws_ami.centOS.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "03_catalogue"
  }
}

resource "aws_route53_record" "catalogue" {
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "catalogue-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.catalogue.public_ip]
}

resource "aws_instance" "redis" {
  ami           = data.aws_ami.centOS.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "04_redis"
  }
}

resource "aws_route53_record" "redis" {
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "redis-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.redis.public_ip]
}

resource "aws_instance" "user" {
  ami           = data.aws_ami.centOS.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "05_user"
  }
}

resource "aws_route53_record" "user" {
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "user-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.user.public_ip]
}

resource "aws_instance" "cart" {
  ami           = data.aws_ami.centOS.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "06_cart"
  }
}

resource "aws_route53_record" "cart" {
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "cart-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.cart.public_ip]
}

resource "aws_instance" "mysql" {
  ami           = data.aws_ami.centOS.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "07_mysql"
  }
}
resource "aws_route53_record" "mysql" {
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "mysql-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.mysql.public_ip]
}

resource "aws_instance" "shipping" {
  ami           = data.aws_ami.centOS.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "08_shipping"
  }
}

resource "aws_route53_record" "shipping" {
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "shipping-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.frontend.public_ip]
}

resource "aws_instance" "rabbitmq" {
  ami           = data.aws_ami.centOS.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "09_rabbitmq"
  }
}

resource "aws_route53_record" "rabbitmq" {
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "rabbitmq-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.rabbitmq.public_ip]
}

resource "aws_instance" "payment" {
  ami           = data.aws_ami.centOS.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "10_payment"
  }
}

resource "aws_route53_record" "payment" {
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "payment-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.payment.public_ip]
}

resource "aws_instance" "dispatch" {
  ami           = data.aws_ami.centOS.image_id
  instance_type = var.instance_type
  vpc_security_group_ids = [ data.aws_security_group.allow_all.id ]

  tags = {
    Name = "11_dispatch"
  }
}

resource "aws_route53_record" "dispatch" {
  zone_id = "Z07904683H2P61IIEYSB9"
  name    = "dispatch-dev.haseebdevops.online"
  type    = "A"
  ttl     = 25
  records = [aws_instance.dispatch.public_ip]
}