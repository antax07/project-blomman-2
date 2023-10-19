extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var track = rng.randf_range(0.0, 10.0)
var hp = 30

func _ready():
	pass


func _process(delta):
	if hp < 0:
		queue_free()

func hit(damage):
	hp -= damage
