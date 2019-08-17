class_name ItemContainer extends Node

enum SLOT{
  Weapon,
  Armor,
  Boots
}

export(float) var damage
export(float) var defense_modifier
export(float) var speed
export(int) var cost

export(Texture) var icon

export(PackedScene) var projectile

export(SLOT) var slot

func _ready():
	get_node("Sprite").texture = icon
	get_node("Area2D").connect("body_entered", self, "_on_body_entered")

func _on_body_entered(body: Node):
	if body.get("tag") != null and body.tag == "Player":
		buy()

func _create_item() -> Item:
	var item = Item.new()
	item.damage = damage
	item.defense_modifier = defense_modifier
	item.speed = speed
	item.icon = icon
	return item

func _create_weapon() -> Weapon:
	var weapon = Weapon.new()
	weapon.damage = damage
	weapon.defense_modifier = defense_modifier
	weapon.speed = speed
	weapon.icon = icon
	weapon.projectile = projectile
	return weapon

func _equip_item_to_actor(actor: Actor):
	if slot == SLOT.Weapon:
		actor.set_weapon(_create_weapon())
	if slot == SLOT.Armor:
		actor.set_armor(_create_item())
	if slot == SLOT.Boots:
		actor.set_boots(_create_item())

func buy():
	if Global.player_gold >= cost:
		Global.player_gold -= cost
		_equip_item_to_actor(Global.player)
		queue_free()
