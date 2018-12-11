provider "aws" {
  region = "us-east-1"
}

module "webserver_cluster" {
  source = "git@github.com:mirnujAtom/modules.git//services/webserver-cluster?ref=webserver-cluster-1.0.0"

  cluster_name           = "webservers-prod"

  instance_type = "t2.micro"
  min_size      = 1
  max_size      = 2
}

resource "aws_autoscaling_schedule" "scale_out_during_business_hours" {
  scheduled_action_name  = "scale-out-during-business-hours"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 10
  recurrence             = "0 9 * * *"
  autoscaling_group_name = "${module.webserver_cluster.asg_name}"
}

resource "aws_autoscaling_schedule" "scale_in_at_night" {
  scheduled_action_name  = "scale-in-at-night"
  min_size               = 2
  max_size               = 10
  desired_capacity       = 2
  recurrence             = "0 17 * * *"
  autoscaling_group_name = "${module.webserver_cluster.asg_name}"
}

module "database" {
  source = "git@github.com:mirnujAtom/modules.git//services/mysql?ref=database-1.0.0"


  instance_name = "prodDB"
  db_password = "fsjgij0jsdf"
  storage = "10"
}