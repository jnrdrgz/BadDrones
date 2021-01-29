extends Node2D

export (String) var next_level

var path_speed = 250
onready var enemies_node = $Enemies

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func go_to_next_level():
	get_tree().change_scene(next_level)

func _physics_process(delta):
	for enemy in enemies_node.get_children():
		if enemy.get_node("PathFollow2D").has_node("Argos"):
			var e = enemy.get_node("PathFollow2D").get_node("Argos")
			if e:
				if not e.player_already_saw:
					enemy.get_node("PathFollow2D").offset += delta*path_speed

