extends Area2D

export (bool) var up
export (String) var floor_to_go
var up_tex = preload("res://Assets/up.png")
var down_tex = preload("res://Assets/donw.png")

var unlocked = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if up:
		$Sprite.set_texture(up_tex)
	else:
		$Sprite.set_texture(down_tex)

func _on_Stair_body_entered(body):
	if body.is_in_group("player"):
		if unlocked:
			get_tree().change_scene(floor_to_go)
		
