output "centos_terrafrom_ipaddr" {
   value = libvirt_domain.centos_terraform.*.network_interface.0.ad
}

# showing ip from VMs