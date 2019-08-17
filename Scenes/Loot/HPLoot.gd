extends Area2D

export var hp_amount = 1

enum loot_type{GOLD}

onready var anim = $Anim

func collect_gold():
	Global.player.hp += hp_amount
	Global.player.hp = max(Global.player.hp, Global.player.max_hp)
	anim.play("CollectGold")

func _on_GoldLoot_body_entered(body):
	collect_gold()
