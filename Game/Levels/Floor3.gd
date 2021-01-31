extends "res://Game/BaseLevel.gd"

func _ready():
	engine_posible_positions.push_back(Vector2(300,300))	
	has_the_engine = true
	._ready()

