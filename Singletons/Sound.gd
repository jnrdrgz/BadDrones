extends Node2D

onready var music = $Music
onready var gun_shot = $Gunshot
onready var laser = $Laser

var sound_enabled = true

func _ready():
	pass
	
func play(name):
	if sound_enabled:
		if name == "music" and not music.playing:
			music.play()
		if name == "gun_shot":# and not gun_shot.playing:
			gun_shot.play()
		if name == "laser" and not laser.playing:
			laser.play()
			
	
func stop(name):
	if sound_enabled:
		if name == "music" and music.playing:
			music.stop()
		if name == "gun_shot" and gun_shot.playing:
			gun_shot.stop()
		if name == "laser" and laser.playing:
			laser.stop()
