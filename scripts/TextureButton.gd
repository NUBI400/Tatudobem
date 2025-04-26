extends TextureButton
@onready var button = $"."



func _process(delta):
	
	if Input.is_action_just_pressed("start"):
		$"../../botosom".play()


func _on_pressed():
	$"../../AnimationPlayer".play("fade_out")
	$"../../botosom".play()
func _on_animation_player_animation_finished(anim_name):
	get_tree().change_scene_to_file("res://explicacao.tscn")
	disabled = true
	queue_free()
