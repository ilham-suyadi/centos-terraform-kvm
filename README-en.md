# Terrafrom KVM

## a summary of the vm I created

This is my script to create multiple VMs in KVM, and here I use 1 main script which I named worker to create all VMs.
In this configuration I created 2 VMs, and each VM uses the following specifications:

1. Memory 1024 MB
2. 1 you CPU
3. 2 ethernet

for other things that I configured in this script as follows:

1. create 1 user, whose name is app
2. set password for root
3. set ssh keys

## details of the file I used/created

1. Config folder : this folder contains some cloud init config.
2. Network_config.yml : useful for configuring ethernet in VMs.
3. User_data.yml: serves to configure the user in each VMs, starting from the user name, password, ssh key, home directory and so on.
4. Main.tf : contains useful scripts for connecting terraform to KVM.
5. Output.tf : useful for showing the ip of each VMs after running
6. Provider.tf : works to tell the terraform provider what we use
7. Variables.tf : contains variables that will later be used by the main script named worker.tf
8. worker .tf : contains the main script for creating VMs in KVM
Actually for the name or number of files can be set as desired

## running terraform

1. Make sure you have installed terraform, if so, open the terminal.
2. Move to the directory containing the terraform script.
3. Enter the command“terraform init”.
4. To run the terraform script you can use the command “terraform apply” or “terraform apply -auto-approve”.
