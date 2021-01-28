extends Node2D
onready var argos_scn = preload("res://Game/Argos.tscn")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)

func _on_Spawner_timeout():
	add_argo()
	
func add_argo():
	var argo = argos_scn.instance()	
	get_node("Enemies").add_child(argo)
