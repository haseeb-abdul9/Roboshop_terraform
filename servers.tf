resource "aws_instance" "01_frontend" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "01_frontend"
  }
}


resource "aws_instance" "02_mongodb" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "02_mongodb"
  }
}

resource "aws_instance" "03_catalogue" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "03_catalogue"
  }
}

resource "aws_instance" "04_redis" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "04_redis"
  }
}

resource "aws_instance" "05_user" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "05_user"
  }
}

resource "aws_instance" "06_cart" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "06_cart"
  }
}

resource "aws_instance" "07_mysql" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "07_mysql"
  }
}

resource "aws_instance" "08_shipping" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "08_shipping"
  }
}

resource "aws_instance" "09_rabbitMQ" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "09_rabbitMQ"
  }
}

resource "aws_instance" "10_payment" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "10_payment"
  }
}

resource "aws_instance" "11_dispatch" {
  ami           = "ami-0f3c7d07486cad139"
  instance_type = "t3.micro"

  tags = {
    Name = "11_dispatch"
  }
}
