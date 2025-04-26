extends CanvasLayer
#feito pelo Arthur

func _ready():
	pass


func _process(delta):
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://explicacao2.tscn")
		print("ain")
