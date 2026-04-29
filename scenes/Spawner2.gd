extends Node2D

@export var obstacle : PackedScene
@export var player_path : NodePath
@export var min_distance : float = 300
@export var max_distance : float = 600
@export var spawn_rate : float = 3.0

var player

func _ready():
	player = get_node(player_path)
	repeat()

func spawn():
	var spawned = obstacle.instantiate()

	var angle = randf_range(0, TAU)
	var distance = randf_range(min_distance, max_distance)

	var offset = Vector2(cos(angle), sin(angle)) * distance
	spawned.global_position = player.global_position + offset

	get_tree().current_scene.add_child(spawned)

func repeat():
	spawn()
	await get_tree().create_timer(spawn_rate).timeout
	repeat()
