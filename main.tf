provider "aws" {
  region                  = "ap-south-1"
  
}


resource "aws_instance" "terraform" {
  ami                    = "ami-0d3f444bc76de0a79"
  instance_type          = "t2.micro"

   tags{
      name= "terraform"
   }

  user_data = <<-EOF
      #!/bin/bash
      sudo yum update -y
      sudo yum install nginx -y
      sudo systemctl start nginx
      sudo systemctl enable nginx
  EOF
}
