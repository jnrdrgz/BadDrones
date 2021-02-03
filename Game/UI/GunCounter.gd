extends NinePatchRect

func _process(delta):
	$Label.text = str(get_tree().current_scene.get_node("Player").ammo)
