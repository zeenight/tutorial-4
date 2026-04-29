extends Node2D

@export var obstacle : PackedScene
@export var spawn_rate : float = 3.0

func _ready():
	repeat()

func spawn():
	var spawned = obstacle.instantiate()
	get_tree().current_scene.add_child(spawned)

	var spawn_pos = global_position
	spawn_pos.x += randf_range(-1000, 1000)

	spawned.global_position = spawn_pos

func repeat():
	while true:
		spawn()
		await get_tree().create_timer(spawn_rate).timeout
