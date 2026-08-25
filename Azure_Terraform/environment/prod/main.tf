module "rg" {
  source         = "../../modules/resource_group"
  resource_group = var.resource_group
}

module "vnet" {
  depends_on      = [module.rg]
  source          = "../../modules/virtual_network"
  virtual_network = var.virtual_network
}

module "subnet" {
  depends_on     = [module.vnet]
  source         = "../../modules/subnet"
  subnet_details = var.subnet_details
}

module "vnet_peering" {
  source       = "../../modules/vnet_peering"
  vnet_peering = var.vnet_peering
  vnet         = module.vnet.vnet_id
}

module "NIC" {
  source      = "../../modules/Network_interface"
  nic_details = var.nic_details
  subnet_id   = module.subnet.subnet_id
}

module "public_ip" {
  depends_on = [module.rg]
  source     = "../../modules/public_ip"
  public_ip  = var.public_ip
}

module "Bastion_Host" {
  source       = "../../modules/Bastion_host"
  bastion_host = var.bastion_host
  subnet_id    = module.subnet.subnet_id
  public_ip_id = module.public_ip.pip_id
}

module "nsg" {
  depends_on             = [module.rg]
  source                 = "../../modules/Network_security_group"
  network_security_group = var.network_security_group
}

module "nsg_rule_centralIndia" {
  source   = "../../modules/network_security_rule"
  nsg_rule = var.nsg_rule
  nsg_name = module.nsg.nsg_name
}

module "NAT" {
  depends_on  = [module.rg]
  source      = "../../modules/NAT_gateway"
  NAT_gateway = var.NAT_gateway
}

module "NAT_public_ip_assocation" {
  depends_on         = [module.public_ip, module.NAT]
  source             = "../../modules/NAT_pip_ip_association"
  NAT_pub_ip_associt = var.NAT_pub_ip_associt
  nat_gateway_id     = module.NAT.NAT_gateway
  public_ip_id       = module.public_ip.pip_id
}

module "NAT_SUB_assocation" {
  depends_on         = [module.NAT, module.subnet]
  source             = "../../modules/Nat_subnet_association"
  NAT_SUB_assocation = var.NAT_SUB_assocation
  subnet_id          = module.subnet.subnet_id
  NAT_id             = module.NAT.NAT_gateway
}

module "Linux_VM" {
  source                = "../../modules/linux_virtual_machine"
  linux_virtula_machine = var.linux_virtula_machine
  NIC_id                = module.NIC.NIC_id
}

module "nic_nsg_association" {
  source             = "../../modules/NSG_NIC_Association"
  nic_nsg_assocation = var.nic_nsg_assocation
  NIC_id             = module.NIC.NIC_id
  nsg_id             = module.nsg.nsg_id
}