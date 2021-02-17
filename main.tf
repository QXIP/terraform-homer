terraform {
  required_providers {
    aws = {     
	version = "~> 2.70"
	      source  = "hashicorp/aws"
   	}
   }
}
provider "aws" {
  profile = "default"
  region  = var.region
  access_key = var.access_key
  secret_key = var.secret_key 

}

resource "aws_instance" "web" {

  ami             = lookup(var.amis, var.region) 
  subnet_id       = var.subnet 
  security_groups = var.securityGroups 
  key_name        = var.keyName 
  instance_type   = var.instanceType 

   ebs_block_device {
    device_name = "/dev/xvdb"
    volume_type = "gp2"
    volume_size = var.DiskSize 
  }
  tags = {
    Name = var.instanceName
  }




  provisioner "file" {
  source 	= "files/homer_installer.sh"
  destination	= "/tmp/homer_installer.sh" 
  }

provisioner "remote-exec" {
	inline = [
		"chmod -x /tmp/homer_installer.sh",
		"sudo /tmp/homer_installer.sh",
	]
}

 connection {
    type        = "ssh"
    user        = "admin"
    password    = ""
    private_key = file(var.keyPath)
    host        = self.public_ip
  }
}
