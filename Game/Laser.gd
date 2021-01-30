extends RayCast2D

var is_casting = false
var appeared = false
func _ready():
	set_physics_process(false)
	$Line2D.points[1] = Vector2.ZERO

func _physics_process(delta):
	var cast_point = cast_to
	force_raycast_update()
	
	if is_colliding():
		cast_point = to_local(get_collision_point())
	
	$Line2D.points[1] = cast_point
	$LaserParticlesInLaser.position = cast_point*0.25
	$LaserParticlesInLaser.process_material.emission_box_extents.x = cast_point.length()*0.25

func set_is_casting(cast):
	is_casting = cast	
	
	$LaserParticlesInLaser.emitting = is_casting
	if is_casting:
		if not appeared:
			appear()
	else:
		if appeared:
			disappear()
	
	set_physics_process(cast)

func appear():
	var t = $Tween
	t.stop_all()
	t.interpolate_property($Line2D, "width", 0, 5.0, 0.2)
	t.start()
	appeared = true

func disappear():
	var t = $Tween
	t.stop_all()
	t.interpolate_property($Line2D, "width", 5.0, 0.0, 0.1)
	t.start()
	appeared = false
