extends RigidBody2D
class_name Actor # Needed for inheritance

export(PackedScene) var projectile
export(String) var tag

export var attack_interval = 1.0
export var speed = 1.0
export var hp = 3.0
export var damage = 1.0
export var defense_modifier = 1.0

var _last_attack_time : float
var max_hp : float = hp

var _weapon : Weapon
var _armor : Item
var _boots : Item

var animated_sprite

var is_dead = false

# Called when the node enters the scene tree for the first time.
func _ready():
	animated_sprite = get_node("AnimatedSprite")
	_last_attack_time = Utils.get_time_seconds()
	max_hp = hp

# Called every frame. 'delta' is the elapsed time since the previous frame.
func set_velocity(vx, vy):
	
	# Animation
	if abs(vx) > 0.0 || abs(vy) > 0.0:
		animated_sprite.play("walk")
	else:
		animated_sprite.play("idle")
	
	# Calculate speed
	var final_speed = 0
	final_speed += speed
	if _weapon != null:
		final_speed += _weapon.speed
	if _armor != null:
		final_speed += _armor.speed
	if _boots != null:
		final_speed += _boots.speed
	
	set_linear_velocity(speed*Vector2(vx, vy).normalized())
	
	if vx < 0.0:
		animated_sprite.flip_h = true
	elif vx > 0.0:
		animated_sprite.flip_h = false
	
func attack(target_pos):
	if Utils.get_time_seconds() - _last_attack_time > attack_interval:
		
		var projectile_instance : Projectile
		
		# actor's default projectile or the weapon's projectile?
		if _weapon != null:
			projectile_instance = _weapon.projectile.instance()
		else:
			projectile_instance = projectile.instance()
		
		add_child(projectile_instance)
		projectile_instance.position = Vector2.ZERO
		projectile_instance.look_at(target_pos)
		projectile_instance.set_tag(tag)
		
		# Calculate damage
		var final_damage = 0
		final_damage += damage
		if _weapon != null:
			final_damage += _weapon.damage
		if _armor != null:
			final_damage += _armor.damage
		if _boots != null:
			final_damage += _boots.damage
		
		projectile_instance.set_damage(final_damage)
		_last_attack_time = Utils.get_time_seconds()
		if has_node("SwordSFX"):
			$SwordSFX._play_random_sfx()
	
func apply_damage(damage):
	
	# Calculate damage
	var def_modifer = defense_modifier
	if _weapon != null:
		def_modifer -= _weapon.defense_modifier
	if _armor != null:
		def_modifer -= _armor.defense_modifier
	if _boots != null:
		def_modifer -= _boots.defense_modifier
	
	var final_damage = damage * def_modifer
	
	hp -= final_damage
	if hp <= 0:
		_die()
	
func _die():
	queue_free()

func set_armor(armor : Item):
	_armor = armor

func set_boots(boots : Item):
	_boots = boots

func set_weapon(weapon : Weapon):
	_weapon = weapon