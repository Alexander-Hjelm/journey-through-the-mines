extends Area2D

export (String, FILE, "*.tscn") var scene_change
export (String, FILE, "*.tscn") var scene_change_act_1
export (String, FILE, "*.tscn") var scene_change_act_2
export (String, FILE, "*.tscn") var scene_change_act_3
export (String, FILE, "*.tscn") var scene_change_act_4
export (String, FILE, "*.tscn") var scene_change_act_5
export var play_sfx_exit = true

#export (PackedScene) var exit_sfx = preload("")

export var entrance_id = "A"

export var is_activated = true


func _ready():
	connect("body_entered",self,"_on_Exit_Scene_body_entered")
	if is_activated:
		$DoorOpen.show()


func _on_Exit_Scene_body_entered(body):
	if is_activated:
		Global.level_entrance = entrance_id
		SceneChanger.change_scene(scene_change,1.0)
#		match Global.current_act:
#			Global.acts.ACT_0: 
#				SceneChanger.change_scene(scene_change)
#			Global.acts.ACT_1: 
#				if scene_change_act_1 != "":
#					SceneChanger.change_scene(scene_change_act_1)
#				else:
#					SceneChanger.change_scene(scene_change)
#			Global.acts.ACT_2:
#				if scene_change_act_2 != "":
#					SceneChanger.change_scene(scene_change_act_2)
#				elif scene_change_act_1 != "":
#					SceneChanger.change_scene(scene_change_act_1)
#				else:
#					SceneChanger.change_scene(scene_change)
#			Global.acts.ACT_3:
#				if scene_change_act_3 != "":
#					SceneChanger.change_scene(scene_change_act_3)
#				elif scene_change_act_2 != "":
#					SceneChanger.change_scene(scene_change_act_2)
#				elif scene_change_act_1 != "":
#					SceneChanger.change_scene(scene_change_act_1)
#				else:
#					SceneChanger.change_scene(scene_change)
#			Global.acts.ACT_4:
#				if scene_change_act_4 != "":
#					SceneChanger.change_scene(scene_change_act_4)
#				elif scene_change_act_3 != "":
#					SceneChanger.change_scene(scene_change_act_3)
#				elif scene_change_act_2 != "":
#					SceneChanger.change_scene(scene_change_act_2)
#				elif scene_change_act_1 != "":
#					SceneChanger.change_scene(scene_change_act_1)
#				else:
#					SceneChanger.change_scene(scene_change)
#			Global.acts.ACT_5:
#				if scene_change_act_5 != "":
#					SceneChanger.change_scene(scene_change_act_5)
#				elif scene_change_act_4 != "":
#					SceneChanger.change_scene(scene_change_act_4)
#				elif scene_change_act_3 != "":
#					SceneChanger.change_scene(scene_change_act_3)
#				elif scene_change_act_2 != "":
#					SceneChanger.change_scene(scene_change_act_2)
#				elif scene_change_act_1 != "":
#					SceneChanger.change_scene(scene_change_act_1)
#				else:
#					SceneChanger.change_scene(scene_change)
		
		#Global.player.get_input = false
		
		
		
#		if play_sfx_exit:
#			$ExitSFX.play()


func activate_exit():
	$DoorOpen.show()
	is_activated = true