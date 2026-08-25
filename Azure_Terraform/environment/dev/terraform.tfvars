resource_group = {
  rg-dev = {
    name     = "dev-rg"
    location = "Central India"
  }
}

virtual_network = {
    Hub-vnet = {
      name           = "HUB-vnet"
      location       = "East Asia"
      resource_group = "dev-rg"
      address_space  = ["10.0.0.0/16"]
    }
}

subnet_details = {
  loadbalancer-sub-HUB = {
    name            = "Load_balancer_subnet"
    resource_group  = "dev-rg"
    virtual_network = "HUB-vnet"
    address_prefix  = ["10.0.1.0/26"]
  }

  Bastion-sub-HUB = {
    name            = "AzureBastionSubnet"
    resource_group  = "dev-rg"
    virtual_network = "HUB-vnet"
    address_prefix  = ["10.0.2.0/26"]
  }

  sub-HUB-1 = {
    name            = "main-subnet1"
    resource_group  = "dev-rg"
    virtual_network = "HUB-vnet"
    address_prefix  = ["10.0.3.0/24"]
  }

  sub-HUB-2 = {
    name            = "main-subnet2"
    resource_group  = "dev-rg"
    virtual_network = "HUB-vnet"
    address_prefix  = ["10.0.4.0/24"]
  }
}

public-ip = {
  bastion_pip_ip = {
    name           = "Bastion_pip"
    location       = "East Asia"
    resource_group = "dev-rg"
    sku            = "Standard"
  }

  NAT_gateway_pip_East_Asia = {
    name           = "NAT_gateway_pip_ip_eastasia"
    location       = "East Asia"
    resource_group = "dev-rg"
    sku            = "Standard"
  }

  app_gateway_East_asia_pip_ip = {
    name = "ap-gw-public-ip-EASTASIA"
    location = "East Asia"
    resource_group = "dev-rg"
    sku = "Standard"
  }
}

bastion_host = {
  HUB_Bastion = {
    name           = "BastionHostHUB"
    loaction       = "East Asia"
    resource_group = "dev-rg"
    config_name    = "BastionConfiguration"
    subnet_name    = "Bastion-sub-HUB"
    public_ip      = "bastion_pip_ip"
  }
}

nic_details = {
  
   sub1-nic-vm1-hub = {
    name            = "Main-NIC1"
    resource_group  = "dev-rg"
    location        = "East Asia"
    config_name     = "privateIp"
    subnet_id       = "sub-HUB-1"
    allocation_type = "Dynamic"
  }

  sub2-nic-vm1-hub = {
    name            = "Main-NIC2"
    resource_group  = "dev-rg"
    location        = "East Asia"
    config_name     = "privateIp"
    subnet_id       = "sub-HUB-2"
    allocation_type = "Dynamic"
  }

  
}

NAT_gateway = {
  NAT_gateway_Eastasia = {
    name           = "NAT_gateway_EastAsia"
    location       = "East Asia"
    resource_group = "dev-rg"
  }
}

NAT_pub_ip_associt = {
  NAT_gateway_East_Asia_pub_ip = {
    nat_id       = "NAT_gateway_Eastasia"
    public_ip_id = "NAT_gateway_pip_East_Asia"
  }
}

NAT_SUB_assocation = { 
  EastAsia_nat_subnet1 = {
    subnet_id = "sub-HUB-1"
    NAT_id    = "NAT_gateway_Eastasia"
  }

  EastAsia_nat_subnet2 = {
    subnet_id = "sub-HUB-2"
    NAT_id    = "NAT_gateway_Eastasia"
  }
}

network_security_group = {
  application_security_group = {
    name           = "Application_NSG_East_Asia"
    location       = "East Asia"
    resource_group = "dev-rg"
  }
}

nsg_rule = {
  ssh_rule_EastAsia = {
    name             = "ssh"
    priority         = 100
    direction        = "Inbound"
    access           = "Allow"
    protocol         = "Tcp"
    source_port      = "*"
    destination_port = "22"
    resource_group   = "dev-rg"
    nsg_name         = "application_security_group"
  }

  HTTP_rule_EastAsia = {
    name             = "HTTP"
    priority         = 110
    direction        = "Inbound"
    access           = "Allow"
    protocol         = "Tcp"
    source_port      = "*"
    destination_port = "80"
    resource_group   = "dev-rg"
    nsg_name         = "application_security_group"
  }

  HTTPs_rule_EastAsia = {
    name             = "HTTPs"
    priority         = 120
    direction        = "Inbound"
    access           = "Allow"
    protocol         = "Tcp"
    source_port      = "*"
    destination_port = "443"
    resource_group   = "dev-rg"
    nsg_name         = "application_security_group"
  }
}

nic_nsg_assocation = {
  main-subnet1-nic-nsg = {
    nic_name = "sub1-nic-vm1-hub"
    nsg_name = "application_security_group"
  }

  main-subnet2-nic-nsg = {
    nic_name = "sub2-nic-vm1-hub"
    nsg_name = "application_security_group"
  }
}

linux_virtula_machine = { 
  vm1-eastasia-subnet1 = {
    name           = "VM1-sub1"
    resource_group = "dev-rg"
    location       = "East Asia"
    VM_size        = "Standard_B2as_v2"
    vm_username    = "prod"
    nic_id         = "sub1-nic-vm1-hub"
    passwd         = "Kamboj@203040"
  }

  vm1-eastasia-subnet2 = {
    name           = "VM1-sub2"
    resource_group = "dev-rg"
    location       = "East Asia"
    VM_size        = "Standard_B2as_v2"
    vm_username    = "prod"
    nic_id         = "sub2-nic-vm1-hub"
    passwd         = "Kamboj@203040"
  }
}

application_gateway = {
  app-gw-eastasia = {
    name             = "app-gw-eastasia"
    resource_group   = "dev-rg"
    location         = "East Asia"
    sku_name         = "Standard_v2"
    sku_tier         = "Standard_v2"
    sku_capacity     = 2
    subnet_key       = "loadbalancer-sub-HUB"
    frontend_port    = 80
    public_ip_key    = "app_gateway_East_asia_pip_ip"
    backend_port     = 80
    nic_private_ip_key = ["sub1-nic-vm1-hub", "sub2-nic-vm1-hub"]
  }
}

storage_account_details = {
  storage_account = {
    name = "azurehimanshu2030"
    location = "East Asia"
    resource_group = "dev-rg"
    account_tier = "Standard"
    access_tier = "Hot"
    acc_replication_type = "LRS"
  }
}

blob_container = {
  release_container = {
    name = "releasedocumentations"
    storage_account_id = "storage_account"
    container_access_type = "container"
  }

  data_container = {
    name = "teamsdata"
    storage_account_id = "storage_account"
    container_access_type = "container"
  }
}
