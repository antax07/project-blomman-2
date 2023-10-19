extends CharacterBody2D

@onready var projectile = preload("res://Sprites/projectile.tscn")

func _ready():
	pass

func _process(_delta):
	var enemy_group = get_tree().get_nodes_in_group("enemy")
	for enemy in enemy_group:
		var distance = self.global_position.distance_to(enemy.global_position)

		if distance < 200:
			var new_projectile = projectile.instantiate()
			add_child(new_projectile)
			
			new_projectile.target = enemy



func _on_timer_timeout():
	pass
