locals {
  name_of_nodes = {
    vm1 = {

      name     = "ceph1"
      ip       = "172.31.112.117"
      hostname = "ceph1"
      domain   = "ceph1.hami.cloud"


    }
    vm2 = {
      name     = "ceph2"
      ip       = "172.31.112.118"
      hostname = "ceph2"
      domain   = "ceph2.hami.cloud"
    }
    vm3 = {
      name     = "ceph3"
      ip       = "172.31.112.119"
      hostname = "ceph3"
      domain   = "ceph3.hami.cloud"
    }
  }

  disk = {
    disk0 = {
      size        = "50"
      unit_number = 0
      #   thin_provisioned = data.vsphere_virtual_machine.template.disks.0.thin_provisioned
    } # repeat this for the rest of the disks

    disk1 = {
      size        = "1000"
      unit_number = 1

    } # repeat this for the rest of the disks

    disk2 = {
      size        = "1000"
      unit_number = 2

    } # repeat this for the rest of the disks
    disk3 = {
      size        = "1000"
      unit_number = 3

    } # repeat this for the rest of the disks
    disk4 = {
      size        = "1000"
      unit_number = 4

    } # repeat this for the rest of the disks
  }
}