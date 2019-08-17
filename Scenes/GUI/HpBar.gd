extends ProgressBar

export(String) var _actor_path

var _actor : Node
var _max_hp : float

func _ready():
	_actor = get_node(_actor_path)
	print(_actor)
	_max_hp = _actor.max_hp

func _process(delta):
	if is_instance_valid(_actor):
		var hp = _actor.hp
		value = (hp/_max_hp)
