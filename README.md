# Tutorial 8 - Game Polishing & Balancing

## Proses Pengerjaan

### Latihan 1: Percepatan dan Perlambatan Pergerakan Player

Di versi sebelumnya, Player langsung bergerak di kecepatan maksimum begitu tombol ditekan terasa kaku dan tidak realistis. Saya mengubah ini dengan mengedit `Player.gd`:

Tipe variabel `speed` saya ubah dari `int` ke `float`, lalu saya tambahkan dua konstanta baru: `ACCELERATION` dan `DECELERATION`. Di fungsi `get_input()`, penetapan `velocity.x` sekarang pakai `lerp()` (linear interpolation) alih-alih langsung di-set ke nilai target. Hasilnya, karakter butuh waktu sesaat untuk mencapai kecepatan penuh waktu mulai bergerak, dan melambat secara gradual waktu berhenti.

### Latihan 2: Menambahkan Partikel Lari

Saya ingin pemain bisa "melihat" bahwa karakter sedang berlari cepat, bukan cuma mengandalkan animasi sprite. Solusinya: node `GPUParticles2D` di scene Player.

Konfigurasinya kurang lebih begini  texture pakai `brickGrey.png` dari Kenney Platformer Pack supaya terlihat seperti serpihan batu kecil. Process material-nya `ParticleProcessMaterial` dengan spread 180 derajat, initial velocity 50, dan gravity y = -100 (jadi partikelnya terbang ke atas, bukan jatuh). Emission shape Box dengan scale x = 30, lifetime 0.5 detik, dan posisi y = 40 supaya muncul di dekat kaki karakter.

Partikel tidak menyala terus-menerus. Di fungsi `set_particles()` yang dipanggil tiap frame lewat `_physics_process()`, emitting hanya aktif kalau `velocity.x` sudah mencapai 90% kecepatan maksimum dan Player lagi di lantai (`is_on_floor()`). Jadi partikel cuma muncul waktu karakter benar-benar ngebut.

### Latihan 3: Balancing Spawn Rate

Spawn rate awal enemy spawner itu 1 detik  terlalu brutal. Pemain belum sempat bereaksi, enemy sudah menumpuk.

Saya coba beberapa nilai:
- 1 detik: terlalu banyak enemy, pemain tidak punya waktu lewat.
- 5 detik: terlalu sepi, level jadi membosankan.
- 3 detik: pas. Pemain masih harus hati-hati dan mengatur timing, tapi punya cukup ruang untuk berhasil. Ini titik yang menjaga pemain tetap dalam keadaan *flow*  tidak frustrasi, tidak bosan.

Saya juga menjadikan spawn rate sebagai variabel `@export` supaya bisa diubah langsung lewat Inspector Godot tanpa harus buka kode.

## Opini: Apakah Game Polishing Meningkatkan Kualitas Game?

Singkatnya, ya. Tapi bukan karena alasan yang generik seperti "polishing itu penting."

Percepatan dan perlambatan membuat karakter terasa punya "berat." Sebelumnya, tekan tombol langsung gerak, lepas langsung berhenti  seperti menggeser kotak di lantai. Sekarang ada momen transisi, dan anehnya justru itu yang membuat kontrol terasa lebih enak. Ada sesuatu yang bisa diantisipasi.

Partikel lari menyelesaikan masalah informasi. Tanpa partikel, pemain tidak tahu apakah karakter sudah di kecepatan penuh atau masih akselerasi. Itu informasi gameplay yang relevan, dan sekarang dikomunikasikan lewat visual tanpa perlu UI tambahan.

Mekanik dasar permainan sama persis. Yang berubah cuma bagaimana mekanik itu *terasa*.

## Referensi

- [Interpolation - Godot Docs](https://docs.godotengine.org/en/stable/tutorials/math/interpolation.html)
- [GPUParticles2D - Godot Docs](https://docs.godotengine.org/en/stable/classes/class_gpuparticles2d.html)
- [2D Particle Systems - Godot Docs](https://docs.godotengine.org/en/stable/tutorials/2d/particle_systems_2d.html)
- [Kenney Assets](https://kenney.nl/assets)
