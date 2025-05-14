variable "AWS_REGION" {
    default = "us-east-1"
}
variable "AWS_ACCESS_KEY" {}
variable "AWS_SECRET_KEY" {}
variable "name" {
    type = string
}
variable "db_username" {
    type = string
}
variable "instance_type" {
    default = "db.t3.micro"
}
variable "db_name" {
    type = string
}
variable "environment" {}