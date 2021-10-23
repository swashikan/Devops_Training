sgname = "Acceptance Security Group"

ipblock = ["0.0.0.0/0", "172.16.0.0/16"]

mytag = {
  Name = "Acceptance_SG"
  env  = "Acceptance"
  version = 1
}

amiid = "ami-02e136e904f3da870"

machinetype = "t2.micro"

avaloc = "us-west-1c"

volsize = 5

partloc = "/dev/xvdb"

vpcip = "20.0.0.0/16"

networktag = {
  Name = "Acc_practice_vpc"
  env = "Acceptance"
  version = 1
}

public_subnet = "20.0.1.0/24"

private_subnet = "20.0.2.0/24"

