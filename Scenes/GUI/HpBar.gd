extends ProgressBar

export(String) var _actor_path
export(bool) var _player

var _actor : Node
var _max_hp : float = false

func _ready():
	if(_player):
		_actor = Global.player
		_max_hp = Global.player_max_health
	else:
		_actor = get_node(_actor_path)
		_max_hp = _actor.hp
	

func _process(delta):
	var hp
	if(_player):
		hp = Global.player.hp
	elif is_instance_valid(_actor):
		hp = _actor.hp
	value = (hp/_max_hp)
