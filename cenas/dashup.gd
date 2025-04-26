extends CharacterBody2D


func _process(delta):
#	if transform.origin.x<=0:
#		queue_free()
		
	#movimentacao do lixo/objeto
########
	transform.origin.x -= 5
	move_and_slide()
########


func _on_area_2d_area_entered(area):
	$upsom.play()
	Global.dashes += 4
	if Global.dashes > 4:
			Global.dashes = 4
			print(Global.dashes)
	queue_free()
	Global.explicacao +=1
