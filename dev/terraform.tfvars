sgname = "developement Security Group"

ipblock = ["0.0.0.0/0", "172.16.0.0/16"]

mytag = {
  Name = "Developement_SG"
  env  = "development"
  version = 1
}

amiid = "ami-02e136e904f3da870"

machinetype = "t2.micro"

avaloc = "us-east-1b"

volsize = 5

partloc = "/dev/xvdb"

vpcip = "10.0.0.0/16"

networktag = {
  Name = "Dev_practice_vpc"
  env = "developement"
  version = 1
}

public_subnet = "10.0.1.0/24"

private_subnet = "10.0.2.0/24"

