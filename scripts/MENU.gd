extends Node2D

@onready var fadefade = $AnimationPlayer

# Called when the node enters the scene tree for the first time.
func _ready():
#	$AnimationPlayer.play("fade_in")
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$ParallaxBackground/tatudobenanda.play("default")
	Global.tapodendocabar = false
	
	
