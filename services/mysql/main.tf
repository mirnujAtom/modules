resource "aws_db_instance" "example" {
  engine              = "mysql"
  allocated_storage   = "${var.storage}"
  instance_class      = "${var.instance_class}"
  name                = "${var.instance_name}"
  username            = "${var.username}"
  password            = "${var.db_password}"
  skip_final_snapshot = true
}
