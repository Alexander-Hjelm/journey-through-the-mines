class_name Projectile extends Node2D

export(float) var _time_to_live

var _start_time : float

func _ready():
	_start_time = Utils.get_time_seconds()

func _process(delta):
	if Utils.get_time_seconds() - _start_time > _time_to_live:
		queue_free()