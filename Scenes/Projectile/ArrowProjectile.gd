extends Projectile

export(float) var _speed

func _process(delta):
	var angle = transform.get_rotation()
	var fwd = Vector2(cos(angle), sin(angle))
	position += fwd*_speed/100.0 * delta
