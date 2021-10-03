resource "aws_security_group" "sample_sg" {
  name        = "first_sg"
  description = "Creating new sg"

  ingress = [
    {
      description = "Incoming traffic"
      from_port   = 22
      to_port     = 22
      protocol    = "tcp"

    }
  ]

  egress = [
    {
      from_port   = 0
      to_port     = 0
      protocol    = "-1"
      cidr_blocks = ["0.0.0.0/0"]
    }
  ]

  tags = {
    Name = "Development Security group"
    env  = "development"
  }

}

resource "aws_instance" "sample_instance" {
  ami             = "ami-011996ff98de391d1"
  instance_type   = "t2.micro"
  security_groups = [aws_security_group.sample_sg.name]
  tags = {
    Name = "Development Instance_1"
    env  = "development"
  }
}

resource "aws_iam_role" "sample_role" {
  name = "First role"
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = "sts:AssumeRole"
        Effect = "Allow"
        Sid    = ""
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      },
    ]
  })

  tags = {
    Name = "Development Role_1"
    env  = "development"
  }
}

resource "aws_iam_policy" "Sample_policy" {
  policy = ""

}

resource "aws_volume_attachment" "ebs_att" {
  device_name = "/dev/xvdb"
  volume_id   = aws_ebs_volume.sample_volume.id
  instance_id = aws_instance.sample_instance.id
}


resource "aws_ebs_volume" "sample_volume" {
  availability_zone = "us-east-1"
  size              = 10
}
