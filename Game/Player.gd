extends KinematicBody2D

const PLAYER_MOVE_SPEED = 450

onready var raycast = $RayCast2D

func _ready():
	pass
	
func _physics_process(delta):
	var mouse_pos = get_global_mouse_position()
	look_at(mouse_pos)

	var angle = position.angle_to_point(mouse_pos)

	var direction = Vector2(cos(angle), sin(angle))

	if Input.is_action_pressed("move_up"):
		direction *= -PLAYER_MOVE_SPEED

	if Input.is_action_pressed("move_down"):
		direction *= PLAYER_MOVE_SPEED

	move_and_slide(direction, Vector2.UP)
	
	if Input.is_action_just_pressed("shoot"):
		var collider = raycast.get_collider()
		print("shoot")
		if raycast.is_colliding():
			if collider.has_method("kill"):
				collider.kill()
