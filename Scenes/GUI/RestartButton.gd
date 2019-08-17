extends Button

func _ready():
	connect("pressed", self, "_restart")

func _restart():
	get_tree().reload_current_scene()
