extends TextureButton

@onready var button = $"."

func _process(delta):
	if Global.tapodendocabar == true:
		disabled = false
	else: disabled = true
	
	if Input.is_action_just_pressed("start"):
		$"../../botosom".play()


func _on_pressed():
	
	get_tree().change_scene_to_file("res://cenas/MENU.tscn")
	queue_free()

#func _on_animation_player_animation_finished(anim_name):
#	get_tree().change_scene_to_file("res://cenas/cena_principal.tscn")
#	queue_free()


func _on_button_down():
	$"../../botosom".play()
	
