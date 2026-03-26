extends Area2D

@export var sceneName: String = "Level 1"

func _on_Area_Trigger_body_entered(body):
	if body.get_name() == "Player":
		Transition.change_scene(str("res://scenes/" + sceneName + ".tscn"))
