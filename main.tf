#VPC
resource "aws_vpc" "this" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name      = "VPC"
    CanDelete = "Yes"
    Service   = "VPC"
    Region    = "us-east-1"
  }
}
resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.this.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name       = "VPC1"
    Region     = "us-east-1"
    Environent = "DEV"
    User       = "Vikas"
  }
}

#S3 Bucket
resource "aws_s3_bucket" "mytestbucket" {
  bucket = "my-tf-test-buckeerert"

  tags = {
    Name        = "My bucket"
    Environment = "Dev"

  }
}
#aws sqs
resource "aws_sqs_queue" "terraform_queue" {
  name                      = "terraform-example-queue"
  delay_seconds             = 90
  max_message_size          = 2048
  message_retention_seconds = 86400
  receive_wait_time_seconds = 10

  tags = {
    Environment = "production"
    Region      = "us-east-1"
  }
}

#aws sns 
resource "aws_sns_topic" "topcic53" {
  name = "user-updates-topic"

  tags = {
    Name   = "mybucket232323"
    Region = "us-east-1"

  }
}

#ec2 instance

resource "aws_instance" "this" {
  ami           = "ami-01bc990364452ab3e"
  instance_type = "t3a.micro"
  subnet_id     = aws_subnet.main.id
  

  tags = {
    Name = "myec2instanc"

  }
}