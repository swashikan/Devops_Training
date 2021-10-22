resource "aws_security_group" "sample_sg" {
  name        = var.sgname
  description = "Creating new sg"

  ingress = [
    {
      description      = "Incoming traffic"
      from_port        = 22
      to_port          = 22
      protocol         = "TCP"
      ipv6_cidr_blocks = ["::/0"]
      prefix_list_ids  = null
      security_groups  = null
      self             = null
      cidr_blocks      = var.ipblock
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

  tags = var.mytag

}

resource "aws_instance" "sample_instance" {
  ami                  = var.amiid
  instance_type        = var.machinetype
  availability_zone = var.avaloc
  security_groups      = [aws_security_group.sample_sg.name]
  iam_instance_profile = aws_iam_instance_profile.sample-instance-profile.id
  tags = var.mytag
}

resource "aws_iam_role" "sample_role" {
  name = "Development-Role"
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

  tags = var.mytag
}

resource "aws_iam_policy_attachment" "Sample_policy_attachment" {
  name       = "dev_policy_attachment"
  policy_arn = "arn:aws:iam::aws:policy/service-role/AmazonEC2RoleforSSM"
  roles      = [aws_iam_role.sample_role.id]
}

resource "aws_iam_instance_profile" "sample-instance-profile" {
  name = "instanceprofile"
  role = aws_iam_role.sample_role.name
}

resource "aws_ebs_volume" "sample_volume" {
  availability_zone = var.avaloc
  size              = var.volsize
}

resource "aws_volume_attachment" "sample_volume_attachment" {
  device_name = var.partloc
  volume_id   = aws_ebs_volume.sample_volume.id
  instance_id = aws_instance.sample_instance.id
}

