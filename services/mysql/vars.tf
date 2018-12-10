variable "db_password" {
  description = "The password for the database"
}

variable "storage" {
  description = "DB instance storage"
}

variable "instance_class" {
  description = "DB instnance class"
  default = "db.t2.micro"
}


variable "instance_name" {
  description = "DB instance name"
}

variable "username" {
  description = "database username"
  default = "admin"
}