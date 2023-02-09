variable "baseos_image_url" {
  description = "Centos 7 Image URL Local"
  default     = "{path url for image}"
  # example : "/home/ilham/master-os/CentOS-7-GenericCloud.qcow2"
}

variable "pool_name" {
  description = "KVM Pool Storage"
  default     = "default"
}

variable "virtual_machine_hostname" {
  type        = list(string)
  description = "Virtual Machine names and hostname for setiap vm"
  default     = ["centos-01","centos-02","centos-03"]
}

variable "virtual_machine_domain" {
  description = "Virtual Machine Domain for FQDN suffix"
  default     = "server.com"
}

variable "ssh_username" {
  description = " other user on VM |User remote server"
  default     = "apps"
}

variable "ssh_private_key" {
  description = " ssh key for remote user on VM User remote private key"
  default     = "~/.ssh/id_rsa"
}

variable "client_description" {
  description = "descripstion for VM | VM Usage Description"
  default     = "centos server terrafrom"
}

variable "virtual_machine_worker_memory" {
  description = "set memory for setiap VM | Worker Memory in MB's"
  default     = 1096
}

variable "virtual_machine_worker_vcpu" {
  description = "set number core cpu for Vm"
  default     = 1
}

variable "virtual_machine_worker_count" {
  description = "jumlah VM yang akan dibuat Number of VM"
  default     = 2
}


# description hanya lah sebuah keterangan dan tidak akan di eksekusi