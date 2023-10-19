extends CharacterBody2D

@onready var projectile = preload("res://Sprites/projectile.tscn")
var bullet = 1
@onready var timer1 = $Timer
var timerReady = true

func _ready():
	pass

func _process(_delta):
	var enemy_group = get_tree().get_nodes_in_group("enemy")
	
	if bullet > 0 and timerReady:
		for enemy in enemy_group:
			var distance = self.global_position.distance_to(enemy.global_position)

			if distance < 200:
				var new_projectile = projectile.instantiate()
				add_child(new_projectile)

				new_projectile.target = enemy
				bullet -= 1
				timerReady = false
				timer1.start()

func _on_rpm_timer_timeout():
	timerReady = true
	bullet += 1
