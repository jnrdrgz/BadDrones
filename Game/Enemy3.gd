extends "res://Game/BaseEnemy.gd"

func _ready():
	._ready()
	
func _physics_process(delta):
	.follow_player(delta)

func receive_damage(amount):
	print("kill in enemy3")
	kill()

func kill():
	can_move = false
	$Explosion.visible = true
	$Sprite.visible = false
	$Explosion.play_anim("main_explosion")
	killed = true

func _on_Area2D_body_entered(body):
	if body.is_in_group("player"):
		body.life -= 10
		print(body.life)
		can_spawn_a_col = false
		kill()
