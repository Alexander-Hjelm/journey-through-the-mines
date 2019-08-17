extends RigidBody2D
class_name Actor # Needed for inheritance

export(PackedScene) var projectile
export(String) var tag

export var speed = 1.0
export var hp = 3.0
export var dmg = 1.0

var animated_sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite = get_node("AnimatedSprite")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func set_velocity(vx, vy):
	
	# Animation
	if abs(vx) > 0.0 || abs(vy) > 0.0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
	
	set_linear_velocity(speed*Vector2(vx, vy))
	
	if vx < 0.0:
		animated_sprite.flip_h = true
	elif vx > 0.0:
		animated_sprite.flip_h = false
	
func attack(target_pos):
	var projectile_instance = projectile.instance()
	add_child(projectile_instance)
	projectile_instance.position = Vector2.ZERO
	projectile_instance.look_at(target_pos)
	

func apply_damage(dmg):
	hp -= dmg