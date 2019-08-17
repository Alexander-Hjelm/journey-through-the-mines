extends RigidBody2D
class_name Actor # Needed for inheritance

export var speed = 1.0
export var hp = 3.0
export var dmg = 1.0

var animated_sprite

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite = get_node("AnimatedSprite")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _set_velocity(vx, vy):
	
	# Animation
	if abs(vx) > 0.0 || abs(vy) > 0.0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
	
	set_linear_velocity(speed*Vector2(vx, vy))
	
func _attack(angle):
	pass

func _apply_damage(dmg):
	hp -= dmg