extends CharacterBody2D

@export var speed = 1000

@onready var animation = $AnimationPlayer

func _process(delta):
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()
		
	#if get_animation_direction(rotation) == "up":
	print(rotation)
	print(rotation_degrees)
		
func get_animation_direction(rotation):
	var normalized_rotation = (rotation + 360) % 360
	
	var up_range = [337.5, 22.5]
	var right_range = [67.5, 112.5]
	var down_range = [157.5, 202.5]

	if up_range[0] <= normalized_rotation < up_range[1]:
		return "up"
	elif right_range[0] <= normalized_rotation < right_range[1]:
		return "right"
	elif down_range[0] <= normalized_rotation < down_range[1]:
		return "down"
	else:
		return "left"
