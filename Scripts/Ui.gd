extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _process(delta):
	$Label.text = "Money: " + str(Global.money)



func _on_button_button_down():
	Global.selectedBlomma = 1


func _on_player_anti_snigel_button_down():
	Global.selectedBlomma = 2
