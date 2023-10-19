extends Node

var blommaScene = preload("res://Test/tower.tscn")

func _process(delta):
	if Input.is_action_just_pressed("rightClick"):
		var blommaInstance = blommaScene.instantiate()
		var mouse_position = get_viewport().get_mouse_position()
		blommaInstance.global_position = mouse_position
		add_child(blommaInstance)
