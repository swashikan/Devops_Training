module "prod-instance" {
  source      = "../module/instance"
  sgname      = var.sgname
  ipblock     = var.ipblock
  mytag       = var.mytag
  amiid       = var.amiid
  machinetype = var.machinetype
  avaloc = var.avaloc
  volsize = var.volsize
  partloc = var.partloc
}

module "prod-network" {
  source = "../module/network"
  vpcip = var.vpcip
  networktag = var.networktag
  private_subnet = var.private_subnet
  public_subnet = var.public_subnet
}