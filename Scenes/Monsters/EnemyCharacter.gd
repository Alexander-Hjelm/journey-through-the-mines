extends "res://player/Actor.gd"

export var activated = true
export var knock_back = 250
export var attack_proximity = 30.0
export (PackedScene) var loot = preload("res://Scenes/Loot/Loot.tscn")

var _player : Player

func _ready():
	_player = get_tree().get_root().get_node("MainScene/Player")
	pass

func _process(delta):
	# Character movement
	var player_pos = _player.position
	
	var vx = player_pos.x - position.x
	var vy = player_pos.y - position.y
	
	if (player_pos - position).length() < attack_proximity:
		attack(player_pos)
	
	set_velocity(vx, vy)