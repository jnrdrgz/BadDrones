extends KinematicBody2D

const PLAYER_MOVE_SPEED = 450

onready var raycast = $RayCast2D
onready var anim_player = $AnimationPlayer

enum {GUN, LASER}

var current_weapon = GUN

var life = 1000
var ammo = 100
var laser_ammo

signal dead

signal life_changed(life)
func _on_Life_life_changed(life):
	emit_signal("life_changed", life)


func _ready():
	laser_ammo = $Laser.ammo
	$Laser.visible = true
	connect("dead", self, "signal_handler")

func _process(delta):
	laser_ammo = $Laser.ammo
	
	## la idea no es que sea asi pero para testear
	if Input.is_action_pressed("weapon1"):
		current_weapon = GUN
	if Input.is_action_pressed("weapon2"):
		current_weapon = LASER
		$Laser.visible = true

	if life < 0:
		queue_free()
		emit_signal("dead")
	
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
		if current_weapon == GUN && ammo > 0:
			play_anim("Fire")
			var collider = raycast.get_collider()
			print("shoot")
			ammo -= 1
			if raycast.is_colliding():
				if collider.has_method("receive_damage"):
					collider.receive_damage(1)
				if collider.has_method("set_alreay_saw"):
					collider.set_alreay_saw(true)
					
	if Input.is_action_pressed("shoot"):
		if current_weapon == LASER:
			$Laser.set_is_casting(true)
			var collider = $Laser.get_collider()
			print("shoot")
			if collider:
				if $Laser.is_colliding():
					if collider.has_method("receive_damage"):
						collider.receive_damage(1)
					if collider.has_method("set_alreay_saw"):
						collider.set_alreay_saw(true)
				
	if Input.is_action_just_released("shoot"):
		if current_weapon == LASER:
			$Laser.set_is_casting(false)
		

func play_anim(anim):
	if anim_player.current_animation == anim:
		return
	anim_player.play(anim)
