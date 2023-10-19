extends Node

@export var money = 500
var isPlacing = false
var canPlace = true

var selectedBlomma = 0
#0 = ingen, 1 = blomma ett(apa), 2 = manuell anti snigel

func _process(delta):
	if isPlacing == false and money >= 100:
		canPlace = true

