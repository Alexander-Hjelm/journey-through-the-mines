extends Area2D

export var gold_amount = 1

enum loot_type{GOLD}

onready var anim = $Anim

var collected = false


func collect_gold():
	Global.player_gold += gold_amount
	anim.play("CollectGold")


func _on_GoldLoot_body_entered(body):
	if !collected:
		collected = true
		collect_gold()
