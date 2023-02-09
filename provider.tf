terraform {
  required_providers {
    libvirt = {
      source  = "dmacvicar/libvirt"
      version = "0.6.10"
    }
  }
}

# this file expalain the provider user to terraform, you can see all provider terraform on https://registry.terraform.io/browse/providers
# i'm use kvm or libvirt on local computer