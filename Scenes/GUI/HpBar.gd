extends ProgressBar

export(String) var _actor_path
export(bool) var _player

var _actor : Node
var _max_hp : float = false

func _ready():
	if(_player):
		_actor = Global.player
	else:
		_actor = get_node(_actor_path)
	_max_hp = _actor.hp

func _process(delta):
	if is_instance_valid(_actor):
		var hp = _actor.hp
		value = (hp/_max_hp)
