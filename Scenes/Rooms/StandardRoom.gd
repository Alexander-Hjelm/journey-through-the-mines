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


func set_player_entrance_position():
	if Global.level_entrance != null:
		match Global.level_entrance:
			"East": Global.player.position = $PlayerEntrancePos/East.position
			"South": Global.player.position = $PlayerEntrancePos/South.position
			"West": Global.player.position = $PlayerEntrancePos/West.position
			"North":  Global.player.position = $PlayerEntrancePos/North.position
			"NorthEast": Global.player.position = $PlayerEntrancePos/NorthEast.position
			"SouthWest": Global.player.position = $PlayerEntrancePos/SouthWest.position
			"NorthWest": Global.player.position = $PlayerEntrancePos/NorthWest.position
			"SouthEast":  Global.player.position = $PlayerEntrancePos/SouthEast.position