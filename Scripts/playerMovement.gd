extends CharacterBody2D

@export var speed = 800
var mouse_pos = null
var direction = null
var stop_distance = 10
var isPlacing = Global.isPlacing

func _physics_process(_delta):
	var vel = Vector2(0, 0)
	
	if Input.is_action_pressed("forward") and isPlacing == false:
		mouse_pos = get_global_mouse_position()
		direction = (mouse_pos - position).normalized()
		vel = (direction * speed)
		velocity = vel
		
		if position.distance_to(mouse_pos) < stop_distance:
			velocity = Vector2(0, 0)
		
		move_and_slide()
	if Input.is_action_pressed("rightClick") and isPlacing == false and Global.money >= 100:
		mouse_pos = get_global_mouse_position()
		direction = (mouse_pos - position).normalized()
		vel = (direction * speed)
		if position.distance_to(mouse_pos) > stop_distance:
			velocity = vel
			isPlacing = true
		
	if isPlacing == true:
		move_and_slide()
		if position.distance_to(mouse_pos) < stop_distance:
			velocity = Vector2(0, 0)
			isPlacing = false
	Global.isPlacing = isPlacing
