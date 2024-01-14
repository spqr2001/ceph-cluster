provider "vsphere" {
  user                 = var.user
  password             = var.password
  vsphere_server       = var.vsphere_server
  allow_unverified_ssl = true
}



data "vsphere_datacenter" "datacenter" {
  name = var.datacenter
}

data "vsphere_datastore" "datastore" {
  name          = var.datastore
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_compute_cluster" "cluster" {
  name          = var.compute_cluster
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_network" "network" {
  name          = var.network
  datacenter_id = data.vsphere_datacenter.datacenter.id
}

data "vsphere_virtual_machine" "template" {
  name          = var.template
  datacenter_id = data.vsphere_datacenter.datacenter.id
}



resource "vsphere_virtual_machine" "vm" {
  for_each         = local.name_of_nodes
  name             = each.value.name
  resource_pool_id = data.vsphere_compute_cluster.cluster.resource_pool_id
  datastore_id     = data.vsphere_datastore.datastore.id
  num_cpus         = var.cpus
  memory           = var.memory
  guest_id         = data.vsphere_virtual_machine.template.guest_id
  scsi_type        = data.vsphere_virtual_machine.template.scsi_type
  network_interface {
    network_id   = data.vsphere_network.network.id
    adapter_type = data.vsphere_virtual_machine.template.network_interface_types[0]
  }

  dynamic "disk" {
    for_each = local.disk
    content {
      label = disk.key
      size  = disk.value.size
      # thin_provisioned = disk.value.thin_provisioned
      unit_number = disk.value.unit_number
    }
  }


  # disk {
  #   label            = "disk0"
  #   size             = var.disk
  #   thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
  # }


  clone {
    template_uuid = data.vsphere_virtual_machine.template.id
    customize {
      linux_options {
        host_name = each.value.hostname
        domain    = each.value.domain
      }
      network_interface {
        ipv4_address = each.value.ip
        ipv4_netmask = var.netmask
      }
      ipv4_gateway = var.gateway
    }
  }
}
