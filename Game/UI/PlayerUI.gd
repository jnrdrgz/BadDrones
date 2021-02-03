extends Control

signal life_changed(life)

func _on_Player_life_changed(life):
	emit_signal("life_changed", life)
