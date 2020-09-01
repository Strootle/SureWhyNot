extends Control


func _on_Restart_pressed():
	get_tree().change_scene("res://Start Menu.tscn")

func _on_Restart_button_down():
	$CenterContainer/VBoxContainer/Start/AudioStreamPlayer.play()

func _on_Quit2_pressed():
	get_tree().quit()
