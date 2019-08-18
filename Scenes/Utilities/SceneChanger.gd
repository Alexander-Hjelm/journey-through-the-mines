extends CanvasLayer

signal scene_changed()

onready var anim = $AnimationPlayer
onready var black = $Control/Black

func change_scene(path, delay = 0.5):
	yield(get_tree().create_timer(delay), "timeout")
	print(anim)
	print($AnimationPlayer)
	print(get_node("AnimationPlayer"))
	#anim.play("fade")
	#yield(anim, "animation_finished")
	assert(get_tree().change_scene(path) == OK)
	#anim.play_backwards("fade")
	#yield(anim, "animation_finished")
	emit_signal("scene_changed")


func fade_to_black():
	anim.play("fade")


func fade_in():
	anim.play_backwards("fade")