variable "resource_group" {
  description = "varibale used for creating resource group"
}

variable "virtual_network" {
  description = "varibale used for creating vnet for dev environment"
}

variable "subnet_details" {
  description = "varibale used for creating subnet for HUB network in dev environment"
}

variable "bastion_host" {
  description = "varibale used for creating Bastion in dev environment"
}

variable "public-ip" {
  description = "varibale used for creating Bastion in dev environment"
}

variable "nic_details" {
  description = "varibale used for creating NIC in dev environment"
}

variable "NAT_gateway" {
  description = "varibale used for creating NIC in dev environment"
}

variable "NAT_pub_ip_associt" {
  description = "varibale used for creating nat public ip assocation in dev environment"
}

variable "NAT_SUB_assocation" {
  description = "varibale used for creating nat subnet assocation in dev environment"
}

variable "network_security_group" {
  description = "varibale used for creating nat subnet assocation in dev environment"
}

variable "nsg_rule" {
  description = "varibale used for creating nat subnet assocation in dev environment"
}

variable "nic_nsg_assocation" {
  description = "varibale used for creating nat and nsg assocation in dev environment"
}

variable "linux_virtula_machine" {
  description = "varibale used for creating linux virtual machine in dev environment"
}


variable "application_gateway" {
    description = "This variable is used for application gateway"  
}

variable "storage_account_details" {
  description = "This variable is used to take the data of storage account"
}

variable "blob_container" {
    description = "This variable is used to create the blob container inside the storage account"
}


