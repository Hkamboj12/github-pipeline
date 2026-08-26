# This is my rg module
module "dev-rg" {
  source         = "../../modules/resource_group"
  resource_group = var.resource_group
}

module "vnet-dev" {
  depends_on      = [module.dev-rg]
  source          = "../../modules/virtual_network"
  virtual_network = var.virtual_network
}

module "subnet-dev" {
  depends_on     = [module.vnet-dev]
  source         = "../../modules/subnet"
  subnet_details = var.subnet_details
}

module "public-ip-dev" {
  depends_on = [module.vnet-dev]
  source     = "../../modules/public_ip"
  public_ip  = var.public-ip
}
module "Bastion-Host-dev" {
    depends_on = [ module.dev-rg , module.vnet-dev ]
  source       = "../../modules/Bastion_host"
  bastion_host = var.bastion_host
  subnet_id    = module.subnet-dev.subnet_id
  public_ip_id = module.public-ip-dev.pip_id
}

module "NIC-dev" {
    depends_on = [ module.dev-rg ]
  source      = "../../modules/Network_interface"
  nic_details = var.nic_details
  subnet_id = module.subnet-dev.subnet_id
}

module "NAT-dev" {
    depends_on = [ module.dev-rg ]
  source = "../../modules/NAT_gateway"
  NAT_gateway = var.NAT_gateway
}

module "Nat_public_ip_assocation-dev" {
    depends_on = [ module.dev-rg , module.public-ip-dev , module.NAT-dev ]
  source             = "../../modules/NAT_pip_ip_association"
  NAT_pub_ip_associt = var.NAT_pub_ip_associt
  nat_gateway_id     = module.NAT-dev.NAT_gateway
  public_ip_id       = module.public-ip-dev.pip_id
}

module "NAT_SUB_assocation-dev" {
    source = "../../modules/Nat_subnet_association"
    NAT_SUB_assocation = var.NAT_SUB_assocation
    subnet_id = module.subnet-dev.subnet_id
    NAT_id = module.NAT-dev.NAT_gateway
}

module "nsg-dev" {
  depends_on             = [module.dev-rg]
  source                 = "../../modules/Network_security_group"
  network_security_group = var.network_security_group
}

module "nsg-rule-dev" {
    depends_on = [ module.nsg-dev ]
  source   = "../../modules/network_security_rule"
  nsg_rule = var.nsg_rule
  nsg_name = module.nsg-dev.nsg_name
}

module "nic-nsg-assocation-dev" {
    depends_on = [ module.nsg-dev, module.NIC-dev ]
  source = "../../modules/NSG_NIC_Association"
  nic_nsg_assocation = var.nic_nsg_assocation
  NIC_id = module.NIC-dev.NIC_id
  nsg_id = module.nsg-dev.nsg_id
}

module "Linux_VM" {
    depends_on = [ module.dev-rg,module.vnet-dev ]
  source                = "../../modules/linux_virtual_machine"
  linux_virtula_machine = var.linux_virtula_machine
  NIC_id                = module.NIC-dev.NIC_id
}

module "application_gateway" {
    depends_on = [ module.dev-rg,module.vnet-dev,module.subnet-dev,module.public-ip-dev ]
  source              = "../../modules/application_gateway"
  application_gateway = var.application_gateway
  subnet_id           = module.subnet-dev.subnet_id
  public_ip_address_id = module.public-ip-dev.pip_id
  private_ip_value     = module.NIC-dev.NIC_private_ip
}

module "storage_account" {
  depends_on = [ module.dev-rg ]
  source = "../../modules/storage_account"
  storage_account_details = var.storage_account_details
}

module "blob_container" {
  depends_on = [ module.storage_account ]
  source = "../../modules/blob_container"
  blob_container = var.blob_container
  storage_id = module.storage_account.storage_id
}
