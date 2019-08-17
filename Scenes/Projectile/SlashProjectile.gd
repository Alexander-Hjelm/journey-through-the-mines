extends Projectile

func _ready():
	_time_to_live = 0.05


func _on_body_entered(body: Node):
	if body.has_method("apply_damage"):
		if body.get("tag") != null and body.tag == _tag:
			return
		body.apply_damage(_damage)
		$HitSFX._play_random_sfx()