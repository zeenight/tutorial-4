extends RigidBody2D
# kode buat muter 360 degres
@export var radius: float = 100.0
@export var speed: float = 2.0

var angle: float = 0.0
var center_position: Vector2

func _ready() -> void:
	center_position = global_position

func _process(delta: float) -> void:
	angle += speed * delta
	
	var x = cos(angle) * radius
	var y = sin(angle) * radius
	
	global_position = center_position + Vector2(x, y)
