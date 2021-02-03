extends "res://Game/BaseEnemy.gd"

onready var projectile_enemy_scene = preload("res://Game/Enemy3.tscn") 

var enemies_spawned = 0
var MAX_ENEMIES = 33

func _ready():
	._ready()

func _physics_process(delta):
	#if player_already_saw:
	#	.follow_player(delta)
	pass
	
func spawn_enemy():
	var enemy_instance = projectile_enemy_scene.instance()
	#enemy_instance.scale = Vector2(0.3,0.3)
	enemy_instance.global_position = global_position

	get_tree().current_scene.add_child(enemy_instance)

func _on_EnemyCreationTimer_timeout():
	if enemies_spawned < MAX_ENEMIES:
		spawn_enemy()	
