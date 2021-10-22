variable "vpcip" {
  type = string
  description = "this is the ip for the VPC"
}

variable "networktag" {
  description = "vpctag"
  type = object({
    Name = string
    env = string
    version = number
  })
}

variable "public_subnet" {
  type = string
  description = "ip for the public subnet"
}

variable "private_subnet" {
  type = string
  description = "ip for the private subnet"
}