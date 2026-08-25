resource_group = {
  rg1 = {
    name     = "rg-prod"
    location = "Central India"
  }
}

virtual_network = {
  HUB-vnet = {
    name           = "HUB-vnet"
    location       = "Central India"
    resource_group = "rg-prod"
    address_space  = ["10.0.0.0/16"]
  }

  spoke-vnet1 = {
    name           = "spoake-vnet1"
    location       = "South Africa North"
    resource_group = "rg-prod"
    address_space  = ["11.0.0.0/16"]
  }

  spoke-vnet2 = {
    name           = "spoake-vnet2"
    location       = "East Asia"
    resource_group = "rg-prod"
    address_space  = ["12.0.0.0/16"]
  }
}

subnet_details = {
  loadbalancer-sub-HUB = {
    name            = "Load_balancer_subnet"
    resource_group  = "rg-prod"
    virtual_network = "HUB-vnet"
    address_prefix  = ["10.0.1.0/26"]
  }

  Bastion-sub-HUB = {
    name            = "AzureBastionSubnet"
    resource_group  = "rg-prod"
    virtual_network = "HUB-vnet"
    address_prefix  = ["10.0.2.0/26"]
  }

  main-sub-HUB = {
    name            = "main-subnet"
    resource_group  = "rg-prod"
    virtual_network = "HUB-vnet"
    address_prefix  = ["10.0.3.0/24"]
  }

  spoke1-frontend = {
    name            = "frontend"
    resource_group  = "rg-prod"
    virtual_network = "spoake-vnet1"
    address_prefix  = ["11.0.1.0/24"]
  }

  spoke2-fronted = {
    name            = "fronten"
    resource_group  = "rg-prod"
    virtual_network = "spoake-vnet2"
    address_prefix  = ["12.0.1.0/24"]
  }

}

vnet_peering = {
  HUB-spoake1 = {
    name              = "HUB-to-spoake-vnet1"
    resource_group    = "rg-prod"
    vnet_name         = "HUB-vnet"
    remote_virtual_id = "spoke-vnet1"
  }

  spoake1-HUB = {
    name              = "spoake-vnet1-to-HUB"
    resource_group    = "rg-prod"
    vnet_name         = "spoake-vnet1"
    remote_virtual_id = "HUB-vnet"
  }

  HUB-spoake2 = {
    name              = "HUB-to-spoake-vnet2"
    resource_group    = "rg-prod"
    vnet_name         = "HUB-vnet"
    remote_virtual_id = "spoke-vnet2"
  }

  spoake2-HUB = {
    name              = "spoake-vnet2-to-HUB"
    resource_group    = "rg-prod"
    vnet_name         = "spoake-vnet2"
    remote_virtual_id = "HUB-vnet"
  }

}

nic_details = {
  HUB-vnet-NIC-AzureLoadBalancer = {
    name            = "LoadBalancerNIC"
    resource_group  = "rg-prod"
    location        = "Central India"
    config_name     = "privateIp"
    subnet_id       = "loadbalancer-sub-HUB"
    allocation_type = "Dynamic"
  }

  main-NIC-HUB = {
    name            = "Main-NIC"
    resource_group  = "rg-prod"
    location        = "Central India"
    config_name     = "privateIp"
    subnet_id       = "main-sub-HUB"
    allocation_type = "Dynamic"
  }

  spoke1-frontend-NIC = {
    name            = "fronted-NIC-spoke1"
    resource_group  = "rg-prod"
    location        = "South Africa North"
    config_name     = "privateIp"
    subnet_id       = "spoke1-frontend"
    allocation_type = "Dynamic"
  }

  spoke2-frontend-NIC = {
    name            = "fronted-NIC-spoke2"
    resource_group  = "rg-prod"
    location        = " East Asia"
    config_name     = "privateIp"
    subnet_id       = "spoke2-fronted"
    allocation_type = "Dynamic"
  }
}

public_ip = {
  bastion_pip_ip = {
    name           = "Bastion_pip"
    location       = "Central India"
    resource_group = "rg-prod"
    sku            = "Standard"
  }

  NAT_gateway_pip_CentralIndia = {
    name           = "NAT_gateway_pip_ip_centralIndia"
    location       = "Central India"
    resource_group = "rg-prod"
    sku            = "Standard"
  }

  NAT_gateway_pip_SouthAfricaNorth = {
    name           = "NAT_gateway_pip_ip_SouthAfricaNorth"
    location       = "South Africa North"
    resource_group = "rg-prod"
    sku            = "Standard"
  }

  NAT_gateway_pip_EastAsia = {
    name           = "NAT_gateway_pip_ip_EastAsia"
    location       = " East Asia"
    resource_group = "rg-prod"
    sku            = "Standard"
  }
}

bastion_host = {
  HUB_Bastion = {
    name           = "BastionHostHUB"
    loaction       = "Central India"
    resource_group = "rg-prod"
    config_name    = "BastionConfiguration"
    subnet_name    = "Bastion-sub-HUB"
    public_ip      = "bastion_pip_ip"
  }
}

network_security_group = {
  application_nsg_CIndia = {
    name           = "Application_NSG_Central_india"
    location       = "Central India"
    resource_group = "rg-prod"
  }

  application_nsg_SouthAfricaNorth = {
    name           = "Application_NSG_SouthAfricaNorth"
    location       = "South Africa North"
    resource_group = "rg-prod"
  }

  application_nsg_EastAsia = {
    name           = "Application_NSG_East_Asia"
    location       = " East Asia"
    resource_group = "rg-prod"
  }
}

nsg_rule = {
  ssh_rule_CentralIndia = {
    name             = "ssh"
    priority         = 100
    direction        = "Inbound"
    access           = "Allow"
    protocol         = "Tcp"
    source_port      = "*"
    destination_port = "22"
    resource_group   = "rg-prod"
    nsg_name         = "application_nsg_CIndia"
  }

  ssh_rule_SouthAfricaNorth = {
    name             = "ssh"
    priority         = 100
    direction        = "Inbound"
    access           = "Allow"
    protocol         = "Tcp"
    source_port      = "*"
    destination_port = "22"
    resource_group   = "rg-prod"
    nsg_name         = "application_nsg_SouthAfricaNorth"
  }

  ssh_rule_EastAsia = {
    name             = "ssh"
    priority         = 100
    direction        = "Inbound"
    access           = "Allow"
    protocol         = "Tcp"
    source_port      = "*"
    destination_port = "22"
    resource_group   = "rg-prod"
    nsg_name         = "application_nsg_EastAsia"
  }

  HTTP_rule_CentralIndia = {
    name             = "HTTP"
    priority         = 110
    direction        = "Inbound"
    access           = "Allow"
    protocol         = "Tcp"
    source_port      = "*"
    destination_port = "80"
    resource_group   = "rg-prod"
    nsg_name         = "application_nsg_CIndia"
  }

  HTTP_rule_SouthAfricaNorth = {
    name             = "HTTP"
    priority         = 110
    direction        = "Inbound"
    access           = "Allow"
    protocol         = "Tcp"
    source_port      = "*"
    destination_port = "80"
    resource_group   = "rg-prod"
    nsg_name         = "application_nsg_SouthAfricaNorth"
  }

  HTTP_rule_EastAsia = {
    name             = "HTTP"
    priority         = 110
    direction        = "Inbound"
    access           = "Allow"
    protocol         = "Tcp"
    source_port      = "*"
    destination_port = "80"
    resource_group   = "rg-prod"
    nsg_name         = "application_nsg_EastAsia"
  }

  HTTPs_rule_CentralIndia = {
    name             = "HTTPs"
    priority         = 120
    direction        = "Inbound"
    access           = "Allow"
    protocol         = "Tcp"
    source_port      = "*"
    destination_port = "443"
    resource_group   = "rg-prod"
    nsg_name         = "application_nsg_CIndia"
  }

  HTTPs_rule_SouthAfricaNorth = {
    name             = "HTTPs"
    priority         = 120
    direction        = "Inbound"
    access           = "Allow"
    protocol         = "Tcp"
    source_port      = "*"
    destination_port = "443"
    resource_group   = "rg-prod"
    nsg_name         = "application_nsg_SouthAfricaNorth"
  }

  HTTPs_rule_EastAsia = {
    name             = "HTTPs"
    priority         = 120
    direction        = "Inbound"
    access           = "Allow"
    protocol         = "Tcp"
    source_port      = "*"
    destination_port = "443"
    resource_group   = "rg-prod"
    nsg_name         = "application_nsg_EastAsia"
  }
}

NAT_gateway = {
  NAT_gateway_centralIndia = {
    name           = "NAT_gateway_CentralIndia"
    location       = "Central India"
    resource_group = "rg-prod"
  }

  NAT_gateway_SouthAfricaNorth = {
    name           = "NAT_gateway_SouthAfricaNorth"
    location       = "South Africa North"
    resource_group = "rg-prod"
  }

  NAT_gateway_EastAsia = {
    name           = "NAT_gateway_EastAsia"
    location       = "East Asia"
    resource_group = "rg-prod"
  }
}

NAT_pub_ip_associt = {
  NAT_gateway_CentralIndia_pub_ip = {
    nat_id       = "NAT_gateway_centralIndia"
    public_ip_id = "NAT_gateway_pip_CentralIndia"
  }

  NAT_gateway_SouthAfricaNorth_pub_ip = {
    nat_id       = "NAT_gateway_SouthAfricaNorth"
    public_ip_id = "NAT_gateway_pip_SouthAfricaNorth"
  }

  NAT_gateway_EastAsia_pub_ip = {
    nat_id       = "NAT_gateway_EastAsia"
    public_ip_id = "NAT_gateway_pip_EastAsia"
  }

}

NAT_SUB_assocation = {
  CentralIndia_nat_subnet = {
    subnet_id = "main-sub-HUB"
    NAT_id    = "NAT_gateway_centralIndia"
  }

  SouthAfricaNorth_nat_subnet = {
    subnet_id = "spoke1-frontend"
    NAT_id    = "NAT_gateway_SouthAfricaNorth"
  }

  EastAsia_nat_subnet = {
    subnet_id = "spoke2-fronted"
    NAT_id    = "NAT_gateway_EastAsia"
  }
}

linux_virtula_machine = {
  VM1_CentralIndia_mainSUB = {
    name           = "CentralIndiaVM1"
    resource_group = "rg-prod"
    location       = "Central India"
    VM_size        = "Standard_B2ats_v2"
    vm_username    = "prod"
    nic_id         = "main-NIC-HUB"
    passwd         = "Kamboj@203040"
  }

  VM1_SouthAfricaNorth_Frontend_SUB = {
    name           = "SouthAfricaNorthVM1"
    resource_group = "rg-prod"
    location       = "South Africa North"
    VM_size        = "Standard_D2s_v3"
    vm_username    = "prod"
    nic_id         = "spoke1-frontend-NIC"
    passwd         = "Kamboj@203040"
  }

  VM1_EastAsia_Frontend_SUB = {
    name           = "EastAsiaVM1"
    resource_group = "rg-prod"
    location       = "East Asia"
    VM_size        = "Standard_D2s_v3"
    vm_username    = "prod"
    nic_id         = "spoke2-frontend-NIC"
    passwd         = "Kamboj@203040"
  }
}

nic_nsg_assocation = {
  main-NIC-HUB_nsg_CIndia = {
    nic_name = "main-NIC-HUB"
    nsg_name = "application_nsg_CIndia"
  }

  spoke1-frontend-NIC_nsg_SouthAfricaNorth = {
    nic_name = "spoke1-frontend-NIC"
    nsg_name = "application_nsg_SouthAfricaNorth"
  }

  spoke2-frontend-NIC_nsg_EastAsia = {
    nic_name = "spoke2-frontend-NIC"
    nsg_name = "application_nsg_EastAsia"
  }
}