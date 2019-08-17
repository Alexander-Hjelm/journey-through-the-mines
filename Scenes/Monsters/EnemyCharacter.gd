extends "res://player/Actor.gd"

export var activated = true
export var knock_back = 250
export var attack_proximity = 30.0
export (PackedScene) var gold_loot = preload("res://Scenes/Loot/Loot.tscn")
export (PackedScene) var health_loot = preload("res://Scenes/Loot/Loot.tscn")

export var gold_loot_drop_chance = 0.75
export var health_loot_drop_chance = 0.10

func _process(delta):
	# Character movement
	if activated:
		follow_and_attack_player()
	else:
		set_velocity(0,0)


func follow_and_attack_player():
	var vx = Global.player.position.x - position.x
	var vy = Global.player.position.y - position.y
	
	if ( Global.player.position - position).length() < attack_proximity:
		attack(Global.player.position)
	
	set_velocity(vx, vy)


func apply_damage(dmg):
	if !is_dead:
		hp -= dmg
		if hp <= 0:
			_die()
		else:
			$anim.play("hit")


func _die():
	randomize()
	var random_gold_number = rand_range(0.0,1.0)
	if random_gold_number <= gold_loot_drop_chance:
		var gold_loot_instance = gold_loot.instance()
		gold_loot_instance.position = self.position
		get_tree().get_root().add_child(gold_loot_instance)
	var random_health_number = rand_range(0.0,1.0)
	if random_health_number <= health_loot_drop_chance:
		var health_loot_instance = health_loot.instance()
		health_loot_instance.position = self.position
		get_tree().get_root().add_child(health_loot_instance)
	
	activated = false
	is_dead = true
	$anim.play("death")