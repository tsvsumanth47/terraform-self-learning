terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.72.1"
    }
  }
  required_version = ">=1.5.0"
}
provider "aws" {
  region = "us-west-2"
  }

resource "aws_instance" "allapps" {
    ami = "ami-07c5ecd8498c59db5"
    instance_type = "t2.small"
    key_name = "terraform"
    user_data = file("./install_jenkins.sh")
  
}

output "jenkins_url" {

   value= "http://${aws_instance.allapps.public_ip}:8080"
  
}