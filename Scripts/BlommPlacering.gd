extends Node

var blommaScene = preload("res://Sprites/tower.tscn")

func _process(delta):
	if Input.is_action_just_pressed("rightClick") and Global.money >= 100:
		var blommaInstance = blommaScene.instantiate()
		var mouse_position = get_viewport().get_mouse_position()
		blommaInstance.global_position = mouse_position
		Global.money -= 100
		add_child(blommaInstance)
