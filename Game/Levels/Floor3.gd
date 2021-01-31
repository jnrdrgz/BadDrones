extends "res://Game/BaseLevel.gd"

func _ready():
	engine_posible_positions.push_back($PosibleEngineSpots/Spot1.global_position)	
	has_the_engine = true
	._ready()

