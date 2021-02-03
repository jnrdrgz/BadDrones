extends KinematicBody2D

var player = null
const MOVE_SPEED = 200

var killed = false
var player_already_saw = false

export var health = 3
var can_move = true
var can_spawn_a_col = true

var rng = RandomNumberGenerator.new()


#Shield variables
var shield_activated = false
var timer = null
export var delay = 5

func _ready():
	set_player() 
	
func follow_player(delta):
	if player:
		var vec_to_player = player.global_position - global_position
		vec_to_player = vec_to_player.normalized()

		global_rotation = atan2(vec_to_player.y, vec_to_player.x)

		var collision = move_and_collide(vec_to_player * MOVE_SPEED * delta)

		if collision :
			var obj_coll = collision.collider 

			if obj_coll:
				if obj_coll.is_in_group("walls"):
					kill()
					can_spawn_a_col = false

onready var col_scene = preload("res://Game/LaserCollectable.tscn") 
var spawned_a_col = false
func spawn_collect():
	if not spawned_a_col && can_spawn_a_col:
		var col_inst = col_scene.instance()
		col_inst.scale = Vector2(0.6,0.6)
		col_inst.global_position = global_position
		get_tree().current_scene.add_child(col_inst)
		spawned_a_col = true
			
func _process(delta):
	if killed:
		#rng.randomize()
		var r = rng.randi_range(0,7)
		if r == 4:
			spawn_collect()	
		if $Explosion.finished:
			queue_free()

func receive_damage(amount):
		
	if(!shield_activated):
		if(health <= 0):
			kill()
			return
		print("damaged")
		start_shield()
		health -= amount

func kill():
	can_move = false
	if($CollisionShape2D):
		$CollisionShape2D.disabled = true
	if($Area2D/CollisionShape2D):
		$Area2D/CollisionShape2D.disabled = true
	$Explosion.visible = true
	$Sprite.visible = false
	$Explosion.play_anim("main_explosion")
	killed = true
	
	

func set_player():
	player = get_tree().current_scene.get_node("Player")
	
func _on_Area2D_body_entered(body):
	if body.is_in_group('player'):
		player_already_saw = true

func start_shield():
	create_timer()
	$Shield.visible = true
	shield_activated = true

func stop_shield():
	$Shield.visible = false
	shield_activated = false
		
func create_timer():
	timer = Timer.new()
	timer.set_one_shot(true)
	timer.set_wait_time(delay)
	timer.connect("timeout", self, "stop_shield")
	add_child(timer)
	timer.start()
