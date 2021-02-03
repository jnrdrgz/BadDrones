extends NinePatchRect

func _on_PlayerUI_life_changed(life):
	$Label.text = life
	print(life)

func _process(delta):
	$Label.text = str(get_tree().current_scene.get_node("Player").life)
