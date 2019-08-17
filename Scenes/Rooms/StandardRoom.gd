extends Node2D

export var monster_count = 10

func _init():
	Global.room_node = self


func _ready():
	monster_count = $Enemies.get_child_count()


func check_enemy_amount():
	monster_count -= 1
	if monster_count <= 0:
		get_tree().call_group("exits","activate_exit")