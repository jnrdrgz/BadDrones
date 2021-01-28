extends Node2D
onready var argos_scn = preload("res://Game/Argos.tscn")

func _ready():
	pass # Replace with function body.

func _on_Spawner_timeout():
	add_argo()
	
func add_argo():
	var argo = argos_scn.instance()	
	get_node("Enemies").add_child(argo)
