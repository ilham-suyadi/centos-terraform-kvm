variable "baseos_image_url" {
  description = "Centos 7 Image URL Local"
  default     = "{path url for image}"
  # example : "/home/ilham/master-os/CentOS-7-GenericCloud.qcow2"
}

variable "pool_name" {
  description = "KVM Pool Storage you can see all pool storage use command 'virsh pool-list' or 'sudo virsh pool-list'"
  default     = "default"
}

variable "virtual_machine_hostname" {
  type        = list(string)
  description = "Virtual Machine names and hostname for VMs"
  default     = ["centos-01","centos-02","centos-03"]
}

variable "virtual_machine_domain" {
  description = "Virtual Machine Domain for FQDN suffix"
  default     = "server.com"
}

variable "ssh_username" {
  description = "User remote server"
  default     = "apps"
}

variable "ssh_private_key" {
  description = " ssh key for remote user on VM User remote private key"
  default     = "~/.ssh/id_rsa"
}

variable "client_description" {
  description = "descripstion for VMs"
  default     = "centos server terrafrom"
}

variable "virtual_machine_worker_memory" {
  description = "amount of ram set for VMs"
  default     = 1096
}

variable "virtual_machine_worker_vcpu" {
  description = "number core cpu for VMs"
  default     = 1
}

variable "virtual_machine_worker_count" {
  description = "jumlah VM yang akan dibuat Number of VM"
  default     = 2
}


# description is just a comment and will not be executed