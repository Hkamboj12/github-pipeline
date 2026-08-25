variable "resource_group" {
  description = "Configuration details for the Azure Resource Group where networking and compute resources will be deployed."
}

variable "virtual_network" {
  description = "Configuration settings for the Azure Virtual Network (VNet), including address space and region."
}

variable "subnet_details" {
  description = "Map of subnets to create within the Virtual Network, including address prefixes and service endpoints."
}

variable "vnet_peering" {
  description = "Configuration settings for establishing Virtual Network peering connections between VNets."
}

variable "nic_details" {
  description = "Network Interface Card (NIC) configurations, including private IP allocations and subnet associations."
}

variable "public_ip" {
  description = "Configuration parameters for Public IP address resource allocation (e.g., allocation method, SKU)."
}

variable "bastion_host" {
  description = "Deployment specifications for the Azure Bastion host hosted within the HUB Virtual Network."
}

variable "network_security_group" {
  description = "Configuration map for Network Security Groups (NSGs) used to secure subnet and interface traffic."
}

variable "nsg_rule" {
  description = "Custom inbound and outbound security rules to attach to the designated Network Security Groups."
}

variable "NAT_gateway" {
  description = "Configuration details for Azure NAT Gateway deployments across targeted availability zones or regions."
}

variable "NAT_pub_ip_associt" {
  description = "Associations between NAT Gateways and their corresponding Public IP addresses or prefixes."
}

variable "NAT_SUB_assocation" {
  description = "Map of subnets to be associated with the NAT Gateway for outbound internet access."
}

variable "linux_virtula_machine" {
  description = "Configuration specs for Linux Virtual Machine instances, including OS disk, size, and admin credentials."
}

variable "nic_nsg_assocation" {
  description = "Mapping parameters to associate Network Interface Cards (NICs) with specific Network Security Groups."
}