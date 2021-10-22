variable "sgname" {
  description = "this is the name of the securitygroup"
  type = string
  default = "defaultsg"
  sensitive = true
}

variable "ipblock" {
  description = "to allow ips to access the server"
  type = list(string)
  default = ["0.0.0.0/0","192.168.0.0/24"]
  sensitive = true
}

variable "mytag" {
  description = "sg tag delacration"
  type = object({
    Name = string
    env  = string
    version = number
  })
}

variable "amiid" {
  description = "to define ami id as per env"
}

variable "machinetype" {
  description = "to define what machine we going to use"
}

variable "avaloc" {
  description = "to define the location of volume to be created"
  type = string
}

variable "volsize" {
  description = "to know the added size for the vol"
  type = number
}

variable "partloc" {
  description = "partition name to get attached"
  type = string
}