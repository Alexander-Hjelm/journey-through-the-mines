extends Node2D

export var monster_count = 10


func _ready():
	pass


func check_enemy_amount():
	if monster_count <= 0:
		get_tree().call_group("exits","activate_exit")