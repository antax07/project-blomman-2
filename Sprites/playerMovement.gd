extends CharacterBody2D

@export var speed = 800 
var mouse_pos = null
var dircetion = null

func _physics_process(_delta):
	var vel = Vector2(0, 0)
			
	if Input.is_action_pressed("forward"):
		mouse_pos = get_global_mouse_position()
		dircetion = (mouse_pos - position).normalized()
		vel = (dircetion * speed)
		velocity = vel
		move_and_slide()


