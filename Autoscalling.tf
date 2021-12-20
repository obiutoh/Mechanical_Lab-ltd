

# launch_configuration

 

resource "aws_launch_configuration" "Autoscalling-asg" {

  name_prefix   = "Launch_Template"

  image_id      = "ami-056b1936002ca8ede"

  instance_type = "t2.micro"

 

 # Key name below = Key-pair

 # key_name = "EC2 PRACTICE"

 

  lifecycle {

      create_before_destroy = true

  }

}

 







