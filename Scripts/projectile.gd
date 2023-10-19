extends CharacterBody2D

var target = null
var targetPosition = Vector2(0, 0)
var speed = 500

func _physics_process(delta):
	if target.global_position == null:
		queue_free()
	if not is_instance_valid(target):
		queue_free()
	
	print(target.global_position)
	print(target)
	
	targetPosition = target.global_position
	
	
	
	if target:
		var direction = (targetPosition - global_position).normalized()
		position += direction * speed * delta



func _on_area_2d_area_entered(area):
	if area.is_in_group("enemy"):
		queue_free()
