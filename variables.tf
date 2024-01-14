# vCenter / ESXi Username
variable "user" {}

# vCenter / ESXi Password
variable "password" {}

# vCenter / ESXi Endpoint
variable "vsphere_server" {}

# vCenter / ESXi Datacenter
variable "datacenter" {}

# vCenter / ESXi Datastore
variable "datastore" {}

# vCenter / ESXI Cluster
variable "compute_cluster" {}

# Virtual Machine configuration
# VM Name
variable "name" {}

# Name of OVA template (chosen in import process)
variable "template" {}

# VM Network 
variable "network" {}

# VM Number of CPU's
variable "cpus" {}

# VM Disk

variable "disk" {}

# VM Memory in MB
variable "memory" {}

# VM IP
variable "ip" {}

#VM Netmask
variable "netmask" {}

#VM gateway
variable "gateway" {}

#VM Domain
variable "domain" {}

# VM hostname
variable "hostname" {}

