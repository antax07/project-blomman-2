extends CharacterBody2D

var target = null
var isReady = true

func _process(_delta):
	target = get_target()
	turn(target)
	if isReady:
		fire(target)
	
	
func get_target():
	var enemy_group = get_tree().get_nodes_in_group("enemy")
	var closest_enemy = null
	var highest_track = -1

	for enemy in enemy_group:
		if self.global_position.distance_to(enemy.global_position) < 200:
			var enemy_track = enemy.get("track")
			if enemy_track > highest_track:
				highest_track = enemy_track
				closest_enemy = enemy

	if closest_enemy:
		return closest_enemy

func turn(target):
	if target != null:
		self.look_at(target.global_position)

func fire(target):
	if target != null:
		isReady = false
		target.hit(10)
		await get_tree().create_timer(1).timeout
		isReady = true
		print("pew pew")
