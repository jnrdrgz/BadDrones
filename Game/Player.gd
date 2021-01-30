extends KinematicBody2D

const PLAYER_MOVE_SPEED = 450

onready var raycast = $RayCast2D

enum {GUN, LASER}

var current_weapon = GUN

func _ready():
	pass

func _process(delta):
	## la idea no es que sea asi pero para testear
	if Input.is_action_pressed("weapon1"):
		current_weapon = GUN
	if Input.is_action_pressed("weapon2"):
		current_weapon = LASER
		$Laser.visible = true

	
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
		if current_weapon == GUN:
			var collider = raycast.get_collider()
			print("shoot")
			if raycast.is_colliding():
				if collider.has_method("receive_damage"):
					collider.receive_damage(1)
	
	if Input.is_action_pressed("shoot"):
		if current_weapon == LASER:
			$Laser.set_is_casting(true)
			var collider = $Laser.get_collider()
			print("shoot")
			if collider:
				if $Laser.is_colliding():
					if collider.has_method("receive_damage"):
						collider.receive_damage(1)
	
	if Input.is_action_just_released("shoot"):
		if current_weapon == LASER:
			$Laser.set_is_casting(false)
		
