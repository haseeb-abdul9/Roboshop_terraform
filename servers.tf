resource "aws_instance" "frontend" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "01_frontend"
  }
}
output "frontend" {
  value = aws_instance.frontend.private_ip
}

resource "aws_instance" "mongodb" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "02_mongodb"
  }
}

resource "aws_instance" "catalogue" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "03_catalogue"
  }
}

resource "aws_instance" "redis" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "04_redis"
  }
}

resource "aws_instance" "user" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "05_user"
  }
}

resource "aws_instance" "cart" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "06_cart"
  }
}

resource "aws_instance" "mysql" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "07_mysql"
  }
}

resource "aws_instance" "shipping" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "08_shipping"
  }
}

resource "aws_instance" "abbitMQ" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "09_rabbitMQ"
  }
}

resource "aws_instance" "payment" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "10_payment"
  }
}

resource "aws_instance" "dispatch" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "11_dispatch"
  }
}
