data "template_file" "user_data" {
  count    = var.virtual_machine_worker_count
  template = file("${path.module}/config/user_data.yml")
  vars     = {
    hostname  = var.virtual_machine_hostname[count.index]
    domain    = var.virtual_machine_domain
  }
}

data "template_file" "network_config" {
  template = file("${path.module}/config/network_config.yml")
}

resource "libvirt_volume" "centos_vol" {
  count  = var.virtual_machine_worker_count
  name   = "centos-vol.${count.index}"
  pool   = var.pool_name
  source = var.baseos_image_url
  format = "qcow2"
}

resource "libvirt_volume" "centos_data_vol" {
  count  = var.virtual_machine_worker_count
  name   = "centos-data-vol.${count.index}"
  pool   = var.pool_name
  size   = 10737418240
  format = "qcow2"
}

resource "libvirt_cloudinit_disk" "centos_cloudinit" {
  count          = var.virtual_machine_worker_count
  name           = "centos-cloudinit.${count.index}.iso"
  user_data      = data.template_file.user_data[count.index].rendered
  network_config = data.template_file.network_config.rendered
  pool           = var.pool_name
}

resource "libvirt_domain" "centos_terraform" {
  count	      = var.virtual_machine_worker_count
  name        = var.virtual_machine_hostname[count.index]
  memory      = var.virtual_machine_worker_memory 
  vcpu        = var.virtual_machine_worker_vcpu
  description = var.client_description
  cloudinit   = libvirt_cloudinit_disk.centos_cloudinit[count.index].id
  autostart   = true

  cpu = {
    mode = "host-passthrough"
  }

  network_interface {
    network_name   = "default"
    wait_for_lease = true
    hostname       = var.virtual_machine_hostname[count.index]
  }

  network_interface {
    macvtap = "enp2s7" # interface on server, you can see use command "ip a"
  }

  console {
    type        = "pty"
    target_port = "0"
    target_type = "serial"
  }

  console {
    type        = "pty"
    target_port = "1"
    target_type = "virtio"
  }

  disk {
    volume_id = libvirt_volume.centos_vol[count.index].id
  }

  disk {
    volume_id = libvirt_volume.centos_data_vol[count.index].id
  }
}
