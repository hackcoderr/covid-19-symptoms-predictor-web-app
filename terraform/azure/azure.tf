# Configure the Microsoft Azure Provider
provider "azurerm" {
    features {}
}

# Create a resource group if it doesn't exist
resource "azurerm_resource_group" "covid-rg" {
    name     = "Azure-covid-ResourceGroup"
    location = "Central India"

    tags = {
        Name = "Azure-covid-RG"
        environment = "Production"
    }
}

# Create virtual network
resource "azurerm_virtual_network" "covid-vnet" {
    name                = "Azure-covid-Vnet"
    address_space       = ["192.168.0.0/16"]
    location            = azurerm_resource_group.covid-rg.location
    resource_group_name = azurerm_resource_group.covid-rg.name

    tags = {
        Name = "Azure-covid-VNet"
        environment = "Production"
    }
}

# Create subnet
resource "azurerm_subnet" "covid-subnet" {
    name                 = "Azure-covid-Subnet"
    resource_group_name  = azurerm_resource_group.covid-rg.name
    virtual_network_name = azurerm_virtual_network.covid-vnet.name
    address_prefixes       = ["192.168.0.0/24"]
}

# Create public IPs
resource "azurerm_public_ip" "covid-publicip-1" {
    name                         = "Azure-covid-PublicIP-1"
    location                     = azurerm_resource_group.covid-rg.location
    resource_group_name          = azurerm_resource_group.covid-rg.name
    allocation_method            = "Dynamic"

    tags = {
        Name = "covid-Public-IP-1"
        environment = "Production"
    }
}

resource "azurerm_public_ip" "covid-publicip-2" {
    name                         = "Azure-covid-PublicIP-2"
    location                     = azurerm_resource_group.covid-rg.location
    resource_group_name          = azurerm_resource_group.covid-rg.name
    allocation_method            = "Dynamic"

    tags = {
        Name = "covid-Public-IP-2"
        environment = "Production"
    }
}

resource "azurerm_public_ip" "covid-publicip-3" {
    name                         = "Azure-covid-PublicIP-3"
    location                     = azurerm_resource_group.covid-rg.location
    resource_group_name          = azurerm_resource_group.covid-rg.name
    allocation_method            = "Dynamic"

    tags = {
        Name = "covid-Public-IP-3"
        environment = "Production"
    }
}



# Create Network Security Group and rule
resource "azurerm_network_security_group" "covid-sg" {
    name                = "Azure-covid-SG"
    location            = azurerm_resource_group.covid-rg.location
    resource_group_name = azurerm_resource_group.covid-rg.name

    security_rule {
        name                       = "SSH"
        priority                   = 1001
        direction                  = "Inbound"
        access                     = "Allow"
        protocol                   = "Tcp"
        source_port_range          = "*"
        destination_port_range     = "22"
        source_address_prefix      = "*"
        destination_address_prefix = "*"
    }

    tags = {
        Name = "Azure-covid-SG"
        environment = "Production"
    }
}

# Create network interfaces
resource "azurerm_network_interface" "covid-nic-1" {
    name                      = "myNIC-1"
    location                  = azurerm_resource_group.covid-rg.location
    resource_group_name       = azurerm_resource_group.covid-rg.name

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = azurerm_subnet.covid-subnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.covid-publicip-1.id
    }

    tags = {
        Name = "covid-NIC-1"
        Environment = "Production"
    }
}


# Create network interface
resource "azurerm_network_interface" "covid-nic-2" {
    name                      = "myNIC-2"
    location                  = azurerm_resource_group.covid-rg.location
    resource_group_name       = azurerm_resource_group.covid-rg.name

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = azurerm_subnet.covid-subnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.covid-publicip-2.id
    }

    tags = {
        Name = "covid-NIC-2"
        Environment = "Production"
    }
}

resource "azurerm_network_interface" "covid-nic-3" {
    name                      = "myNIC-3"
    location                  = azurerm_resource_group.covid-rg.location
    resource_group_name       = azurerm_resource_group.covid-rg.name

    ip_configuration {
        name                          = "myNicConfiguration"
        subnet_id                     = azurerm_subnet.covid-subnet.id
        private_ip_address_allocation = "Dynamic"
        public_ip_address_id          = azurerm_public_ip.covid-publicip-3.id
    }

    tags = {
        Name = "covid-NIC-3"
        Environment = "Production"
    }
}




# Connect the security group to the network interface
resource "azurerm_network_interface_security_group_association" "covid-nic-sg-1" {
    network_interface_id      = azurerm_network_interface.covid-nic-1.id
    network_security_group_id = azurerm_network_security_group.covid-sg.id
}

resource "azurerm_network_interface_security_group_association" "covid-nic-sg-2" {
    network_interface_id      = azurerm_network_interface.covid-nic-2.id
    network_security_group_id = azurerm_network_security_group.covid-sg.id
}

resource "azurerm_network_interface_security_group_association" "covid-nic-sg-3" {
    network_interface_id      = azurerm_network_interface.covid-nic-3.id
    network_security_group_id = azurerm_network_security_group.covid-sg.id
}
  

 resource "azurerm_virtual_machine" "main-1" {
  name                  = "az-covid-vm-1"
  location              = azurerm_resource_group.covid-rg.location
  resource_group_name   = azurerm_resource_group.covid-rg.name
  network_interface_ids = [azurerm_network_interface.covid-nic-1.id]
  vm_size               = "Standard_DS1_v2"
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8.1"
    version   = "latest"
  }
  storage_os_disk {
    name              = "covid-disk-1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "covidAdmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  
  tags = {
    Name = "Az-covid-Slave-1"
    Environment = "Production"
  }
}

#create vm
resource "azurerm_virtual_machine" "main-2" {
  name                  = "az-covid-vm-2"
  location              = azurerm_resource_group.covid-rg.location
  resource_group_name   = azurerm_resource_group.covid-rg.name
  network_interface_ids = [azurerm_network_interface.covid-nic-2.id]
  vm_size               = "Standard_DS1_v2"
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8.1"
    version   = "latest"
  }
  storage_os_disk {
    name              = "covid-disk-2"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = "hostname"
    admin_username = "covidAdmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    Name = "Az-covid-Slave-2"
    Environment = "Production"
  }
}


resource "azurerm_virtual_machine" "main-3" {
  name                  = "az-covid-vm-3"
  location              = azurerm_resource_group.covid-rg.location
  resource_group_name   = azurerm_resource_group.covid-rg.name
  network_interface_ids = [azurerm_network_interface.covid-nic-3.id]
  vm_size               = "Standard_DS1_v2"
  delete_os_disk_on_termination = true
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "RedHat"
    offer     = "RHEL"
    sku       = "8.1"
    version   = "latest"
  }
  storage_os_disk {
    name              = "covid-disk-3"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
 os_profile {
    computer_name  = "hostname"
    admin_username = "covidAdmin"
    admin_password = "Password1234!"
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
  tags = {
    Name = "Az-covid-Slave-3"
    Environment = "Production"
  }
}

