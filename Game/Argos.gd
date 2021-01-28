extends KinematicBody2D

var player = null
const MOVE_SPEED = 200
onready var raycast = $RayCast2D

func _ready():
	set_player() 
	
func _physics_process(delta):
	if player == null:
		print("p null")
		return
	
	var vec_to_player = player.global_position - global_position
	vec_to_player = vec_to_player.normalized()
	global_rotation = atan2(vec_to_player.y, vec_to_player.x)
	move_and_collide(vec_to_player * MOVE_SPEED * delta)
	
	
	if raycast.is_colliding():
		var coll = raycast.get_collider()
		if coll.name == "Player":
			get_tree().change_scene("res://Menu.tscn")

func kill():
	print("kill")
	queue_free()
	
func set_player():
	player = get_parent().get_parent().get_node("Player")



