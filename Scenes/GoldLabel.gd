extends Label

func _process(delta):
	if(Global.player_gold != null):
		text = str(Global.player_gold)
	else:
		text = str(0)