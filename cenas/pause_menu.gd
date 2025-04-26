extends CanvasLayer
@onready var resume = $VBoxContainer/resume



# Called when the node enters the scene tree for the first time.
func _ready():
	visible = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _unhandled_input(event):
	if event.is_action_pressed("pause"):
		visible = true
		get_tree().paused = true
		resume.grab_focus()


func _on_sair_pressed():
	get_tree().quit()
	

func _on_resume_pressed():
	get_tree().paused = false
	visible = false
