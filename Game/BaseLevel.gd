extends Node2D

export (String) var next_level

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func go_to_next_level():
	get_tree().change_scene(next_level)
