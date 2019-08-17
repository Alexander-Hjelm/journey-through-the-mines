extends Area2D

export var gold_amount = 1

enum loot_type{GOLD}

onready var anim = $Anim


func collect_gold():
	Global.player_gold += gold_amount
	anim.play("CollectGold")


func _on_GoldLoot_body_entered(body):
	collect_gold()
