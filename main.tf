resource "aws_security_group" "sample_sg" {
  name        = "dev_first_sg"
  description = "Creating new sg"
  vpc_id      = "vpc-07925b579b02ffe66"

  ingress = [
    {
      description      = "Incoming traffic"
      from_port        = 22
      to_port          = 22
      protocol         = "tcp"
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
      cidr_blocks      = ["0.0.0.0/0"]
    }
  ]

  egress = [
    {
      from_port        = 0
      to_port          = 0
      protocol         = "-1"
      cidr_blocks      = ["0.0.0.0/0"]
      ipv6_cidr_blocks = ["::/0"]
      description      = "Outgoing Traffic"
      prefix_list_ids  = null
      security_groups  = null
      self             = null
    }
  ]

  tags = {
    Name = "Development Security group"
    env  = "development"
  }

}

resource "aws_instance" "sample_instance" {
  ami                  = "ami-011996ff98de391d1"
  instance_type        = "t2.micro"
  security_groups      = [aws_security_group.sample_sg.name]
  iam_instance_profile = aws_iam_policy_attachment.Sample_policy_attachment.id
  availability_zone    = "us-east-1"
  tags = {
    Name = "Development Instance_1"
    env  = "development"
  }
}

resource "aws_iam_role" "sample_role" {
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

resource "aws_iam_policy_attachment" "Sample_policy_attachment" {
  name       = "dev_policy_attachment"
  roles      = [aws_iam_role.sample_role.id]
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
}
