env = "dev"

db_servers = {
  mongodb ={
    name = "mongodb"
    instance_type = "t3.micro"
  }
  redis ={
    name = "redis"
    instance_type = "t3.micro"
  }
  mysql ={
    name = "mysql"
    instance_type = "t3.micro"
    password = "Roboshop@1"
  }
  rabbitmq ={
    name = "rabbitmq"
    instance_type = "t3.micro"
    password = "Roboshop@1"
  }
  dispatch ={
    name = "dispatch"
    instance_type = "t3.micro"
  }
}

app_servers = {
  frontend ={
    name = "frontend"
    instance_type = "t3.medium"
  }
  catalogue ={
    name = "catalogue"
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
  shipping ={
    name = "shipping"
    instance_type = "t3.medium"
    password = "Roboshop@1"
  }
  payment ={
    name = "payment"
    instance_type = "t3.micro"
    password = "Roboshop@1"
  }
}