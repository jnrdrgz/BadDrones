extends Sprite

func _ready():
	pass

func _process(delta):
	self.position = get_global_mouse_position()	
