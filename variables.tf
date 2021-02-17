variable "access_key" {
   default = "<PUT IN YOUR AWS ACCESS KEY>"
}
variable "secret_key" {
   default = "<PUT IN YOUR AWS SECRET KEY>"
}
variable "region" {
   default = "us-east-1"
}
variable "availabilityZone" {
   default = "us-east-1a"
}
variable "instanceType" {
   default = "t2.micro"
}
variable "keyName" {
   default = "<PUT IN NAME OF YOUR AWS PEM KEY>"
}
variable "DiskSize" {
   default = "PUT IN YOUR DISK SIZE NUMBER"
}
variable "keyPath" {
   default = "~/<PUT NAME AND PATH OF THE AWS PEM KEY>.pem"
}
variable "subnet" {
   default = "subnet-<PUT IN YOUR VPC SUBNET>"
}
variable "instanceName" {
   default ="PUT IN YOUR INSTANCE NAME"
variable "securityGroups" {
   type = list
   default = [ "sg-<PUT IN YOUR VPC SECURITY GROUP>" ]
}
