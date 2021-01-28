extends StaticBody2D

onready var anim_player = $AnimationPlayer

func _ready():
	play_anim("main_anim")
	
func play_anim(anim):
	if anim_player.current_animation == anim:
		return
	anim_player.play(anim)

