extends Area2D

export var gold_amount = 1

enum loot_type{GOLD}

onready var anim = $Anim

func _ready():
	connect("body_entered", self, "collect_gold")


func collect_gold():
	Global.player_gold += gold_amount
	anim.play("CollectGold")