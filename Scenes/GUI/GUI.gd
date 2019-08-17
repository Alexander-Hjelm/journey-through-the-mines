extends Control

func _init():
	Global.gui = self

func set_weapon_texture(texture: Texture):
	get_node("WeaponItemBox/TextureRect").texture = texture
	
func set_armor_texture(texture: Texture):
	get_node("ArmorItemBox/TextureRect").texture = texture
	
func set_boots_texture(texture: Texture):
	print("set_boots_texture")
	get_node("BootsItemBox/TextureRect").texture = texture