extends CharacterBody2D

var target = null
var targetPosition = Vector2(0, 0)
var speed = 500

func _physics_process(delta):
	if target == null:
		queue_free()
	
	print(target.global_position)
	print(target)
	
	targetPosition = target.global_position
	
	
	
	if target:
		var direction = (targetPosition - global_position).normalized()
		position += direction * speed * delta

