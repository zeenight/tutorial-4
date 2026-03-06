extends Area2D

@export var sceneName = "LoseScreen"

func _on_body_entered_bee(body):
	print("Something entered:", body.name)
	if body.get_name() == "Player":
		print("hello")
		get_tree().change_scene_to_file(str("res://scenes/" + sceneName + ".tscn"))
