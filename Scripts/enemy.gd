extends CharacterBody2D

var rng = RandomNumberGenerator.new()
var track = 0
var hp = 30
var speed = 100

func _ready():
	var track


func _process(delta):
	if hp < 0:
		queue_free()
	
	track = get_parent().get_progress_ratio()
		
	get_parent().set_progress(get_parent().get_progress() + speed * delta)
	if get_parent().get_progress_ratio() == 1:
		queue_free()

func hit(damage):
	hp -= damage
