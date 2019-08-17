extends Actor

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# Character movement
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
	if Input.is_action_just_pressed("attack"):
		attack(get_global_mouse_position())
	
	set_velocity(vx, vy)