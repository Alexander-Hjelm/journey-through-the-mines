class_name Player extends Actor

func _init():
	Global.player = self
	Global.player_max_health = hp
	if Global.player_health != 0:
		hp = Global.player_health

func _process(delta):
	# Character movement
	if !is_dead:
		var vx = 0.0
		var vy = 0.0
		if Input.is_action_pressed("ui_up"):
			vy -= 1.0
		if Input.is_action_pressed("ui_down"):
			vy += 1.0
		if Input.is_action_pressed("ui_right"):
			vx += 1.0
		if Input.is_action_pressed("ui_left"):
			vx -= 1.0
		if Input.is_action_pressed("attack"):
			attack(get_global_mouse_position())
		
		set_velocity(vx, vy)
		Global.player_health = hp

func _die():
	print("die")
	Global.gui.show_lose_menu()
	._die()