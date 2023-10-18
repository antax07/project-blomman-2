extends CharacterBody2D

@export var speed = 800
var mouse_pos = null
var direction = null
var stop_distance = 20
var isPlacing = false
var isMoving = false

func _physics_process(_delta):
	var vel = Vector2(0, 0)
	###########  registrerar att du högerklickar och tar fram vart du ska
	if Input.is_action_pressed("rightClick") and isPlacing == false:
		isPlacing = true
		mouse_pos = get_global_mouse_position()
		direction = (mouse_pos - position).normalized()
		vel = (direction * speed)
		velocity = vel
	#############  flyttar på player dit du placerar en blomma
	if isPlacing == true:
		vel = (direction * speed)
		velocity = vel
		if position.distance_to(mouse_pos) < stop_distance:
			isPlacing = false
		move_and_slide()
		########## flyttar player med vänster click 
	if Input.is_action_pressed("forward") and isPlacing == false:
		isMoving = true
		mouse_pos = get_global_mouse_position()
		direction = (mouse_pos - position).normalized()
		vel = (direction * speed)
		velocity = vel
		############# stoppar player så att han inte spassar 
	if isMoving == true:
		vel = (direction * speed)
		velocity = vel
		if position.distance_to(mouse_pos) < stop_distance:
			isMoving = false
		move_and_slide()

