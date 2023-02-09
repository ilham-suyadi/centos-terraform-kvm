
# Terrafrom KVM

## Ringkasan dari VM yang saya buat

Ini adalah yang saya gunakan untuk membuat VMs di KVM, di sini saya menggunakan 1 file script utama yang saya beri nama worker untuk membuat semua VMs.
Saya membuat 2 VMs, yang menggunakan spesifikasi berikut ini :

1. 1024 MB memory
2. 1 core CPU
3. 2 ethernet

Hal-hal lainnya yang saya konfigurasi di dalam script saya sebagi berikut:

1. Membuat 1 user, yang bernama app
2. Mengatur password untuk root

## rincian file yang saya gunakan/buat

1. Folder config : folder ini berisi beberapa config cloud init.
2. Network_config.yml : berguna untuk mengkonfigurasi ethernet yang berada di VMs.
3. User_data.yml: berfungsi untuk mengkonfigurasi user yang ada di setiap VMs , mulai dari name user,password,ssh key, directory home dan lain lain.
4. Main.tf : berisi script yang berguna untuk menghubungkan terraform ke KVM.
5. Output.tf : berguna untuk memperlihatkan ip dari setiap VMs setelah berjalan
6. Provider.tf : berfungsi untuk memberi tahu kepada terraform provider apa yang kita gunakan
7. Variables.tf : berisi variabel yang nanti akan digunakan oleh script utama yang bernama worker.tf
8. worker .tf : berisi script utama untuk membuat VMs di KVM

Sebenarnya untuk nama ataupun maupun jumlah file bisa diatur sesuai keinginan

## menjalankan terraform

1. Pastikan anda sudah menginstall terraform, jika sudah Buka terminal.
2. Pindah ke directory yang berisi script terraform.
3. Masukkan perintah “terraform init”.
4. Untuk menjalankan script terraform anda bisa menggunakan perintah “terraform apply” atau “terraform apply -auto-approve”.
