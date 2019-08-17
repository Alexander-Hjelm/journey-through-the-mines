extends Control

export(PackedScene) var win_menu
export(PackedScene) var lose_menu

var _hurt_overlay_alpha = 0

func _init():
	Global.gui = self

func _process(delta):
	_hurt_overlay_alpha -= delta*3
	_hurt_overlay_alpha = max(0, _hurt_overlay_alpha)
	for child in get_node("HurtOverlay").get_children():
		child.modulate = Color(1,1,1, _hurt_overlay_alpha)

func set_hurt_overlay_alpha(alpha: float):
	_hurt_overlay_alpha = alpha

func set_weapon_texture(texture: Texture):
	get_node("WeaponItemBox/TextureRect").texture = texture
	
func set_armor_texture(texture: Texture):
	get_node("ArmorItemBox/TextureRect").texture = texture
	
func set_boots_texture(texture: Texture):
	print("set_boots_texture")
	get_node("BootsItemBox/TextureRect").texture = texture

func show_win_menu():
	add_child(win_menu.instance())

func show_lose_menu():
	print("show_lose_menu")
	add_child(lose_menu.instance())