extends Area2D

var shootingRange = 100  # Set the range in which the tower can detect enemies
var timer = Timer.new()

func _ready():
	add_child(timer)
	timer.connect("timeout", self, "_on_timer_timeout")  # Use "self" to connect to the current script
	timer.wait_time = 1.0  # Adjust the firing rate

func _on_area_entered(area):
	if area.is_in_group("enemy"):
		timer.start()

func _on_area_exited(area):
	if area.is_in_group("enemy"):
		timer.stop()

func _on_timer_timeout():
	print("projectile shoot")
