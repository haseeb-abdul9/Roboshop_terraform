locals {
  Name = var.env!=""? "${var.component_name}-${var.env}" : var.component_name
  db_commands = [
    "rm -rf roboshop_shell",
    "git clone https://github.com/haseeb-abdul9/roboshop_shell.git",
    "cd roboshop_shell",
    "sudo bash ${var.component_name}.sh ${var.password}"
  ]
  app_commands = [
    "sudo labauto ansible",
    "ansible-pull -i localhost. -u https://github.com/haseeb-abdul9/roboshop_ansible.git roboshop.yml -env=${var.env} -e role_name=${var.component_name}"
  ]
}