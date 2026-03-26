# tutorial 6 UI

---

## 1. Sistem Transisi Scene

### Deskripsi

Fitur ini digunakan untuk memberikan efek visual (fade/dissolve) saat berpindah antar scene, sehingga perpindahan tidak terasa tiba-tiba dan memberikan pengalaman yang lebih halus bagi pemain.

### Detail Implementasi

- Menggunakan node `CanvasLayer`
- Menggunakan `AnimationPlayer` dengan animasi bernama `"dissolve"`
- Menggunakan mekanisme asynchronous dengan `await` untuk menunggu animasi selesai sebelum berpindah scene

### Cara Kerja

1. Animasi `"dissolve"` diputar (fade out)
2. Sistem menunggu hingga animasi selesai menggunakan `await`
3. Scene diganti menggunakan fungsi: `get_tree().change_scene_to_file(target)`
4. Animasi diputar secara terbalik (fade in)

### Contoh Kode
```gdscript
extends CanvasLayer

func change_scene(target: String) -> void:
    $AnimationPlayer.play("dissolve")
    await $AnimationPlayer.animation_finished

    get_tree().change_scene_to_file(target)

    $AnimationPlayer.play_backwards("dissolve")
```



## 2. Tombol Kembali ke Menu (Saat Bermain)

### Deskripsi

Fitur ini memungkinkan pemain untuk kembali ke menu utama kapan saja selama permainan berlangsung.

### Detail Implementasi

- Menggunakan node `Button`
- Menggunakan signal `pressed()`
- Dapat diintegrasikan dengan sistem transisi

### Cara Kerja

1. Pemain menekan tombol **"Back to Menu"**
2. Signal `pressed()` dipicu
3. Sistem memanggil fungsi untuk berpindah ke scene menu utama
4. *(Opsional)* Menggunakan sistem transisi untuk perpindahan yang lebih halus

### Contoh Kode (Tanpa Transisi)
```gdscript
func _on_button_pressed():
    get_tree().change_scene_to_file("res://scenes/MainMenu.tscn")
```

### Contoh Kode (Dengan Transisi)
```gdscript
func _on_button_pressed():
    Transition.change_scene("res://scenes/MainMenu.tscn")
```ZZZZZZZZZZZZZZZZZZZ
