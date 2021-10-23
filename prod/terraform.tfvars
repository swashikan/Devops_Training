sgname = "Production Security Group"

ipblock = ["0.0.0.0/0", "172.16.0.0/16"]

mytag = {
  Name = "Production_SG"
  env  = "Production"
  version = 1
}

amiid = "ami-02e136e904f3da870"

machinetype = "t2.micro"

avaloc = "ap-south-1a"

volsize = 5

partloc = "/dev/xvdb"

vpcip = "30.0.0.0/16"

networktag = {
  Name = "Prod_practice_vpc"
  env = "Production"
  version = 1
}

public_subnet = "30.0.1.0/24"

private_subnet = "30.0.2.0/24"

