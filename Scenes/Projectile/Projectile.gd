class_name Projectile extends Node2D

export(float) var _time_to_live

export(bool) var _destroy_on_hit

var _tag : String
var _damage : float
var _start_time : float

func _ready():
	_start_time = Utils.get_time_seconds()
	get_node("Area2D").connect("body_entered", self, "_on_body_entered")
	if has_node("AnimatedSprite"):
		get_node("AnimatedSprite").play("default")

func _process(delta):
	if Utils.get_time_seconds() - _start_time > _time_to_live:
		queue_free()

func set_tag(tag: String):
	_tag = tag

func set_damage(damage: float):
	_damage = damage

func _on_body_entered(body: Node):
	if body.has_method("apply_damage"):
		if body.get("tag") != null and body.tag == _tag:
			return
		body.apply_damage(_damage)
		if _destroy_on_hit:
			queue_free()