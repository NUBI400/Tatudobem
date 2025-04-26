extends CanvasLayer


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
func _process(delta):
	$AnimatedSprite2D.play("default")


func _unhandled_input(event):
	if Input.is_action_just_pressed("pause"):
		get_tree().change_scene_to_file("res://cenas/cena_principal.tscn")
		print("ain")
		
	
