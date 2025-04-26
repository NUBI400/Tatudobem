extends CharacterBody2D

var morte = preload("res://Tatumorte.tscn")

@onready var particles = $GPUParticles2D
@onready var particles2 = $GPUParticles2D2
@onready var ghost_timer = $GhostTimer

@export var ghost_node : PackedScene

var multiplicador_dash = 1

var  gravidade = 40
var pulo = -1000
var velocidade = 400

const no_chao = 1
const no_ar = 2
const caindo = 3
var ESTADO_PULO = no_chao

const ANDANDO = 1
const ABAIXANDO = 2
var ESTADO_MOVIMENTO = ANDANDO

func _physics_process(delta):
	
	print(Global.pontos)
	if Input.is_action_just_pressed("dash") && ESTADO_PULO == no_ar && Global.dashes>=1:
		dash()
		gravidade -=325
		Global.dashes -= 1
		$dash.play()
		
		
	else: gravidade = 40
	
	if $Sprite2D.scale.y > 2:
		$Sprite2D.scale.y = 2
	
	if $Sprite2D.scale.x > 2:
		$Sprite2D.scale.x = 2
	
	if ESTADO_MOVIMENTO == ANDANDO && ESTADO_PULO == no_chao:
		$Sprite2D.play("andando")
		particles.emitting = true
	
#	print(ESTADO_MOVIMENTO)
	if ESTADO_MOVIMENTO == ANDANDO:
		andando()
	if ESTADO_MOVIMENTO == ABAIXANDO:
		rolando()
	
	if ESTADO_PULO == no_chao:
		chao()
	if ESTADO_PULO == no_ar:
		pulando()
	if ESTADO_PULO == caindo:
		to_caindo_socorro()
	
	
	if not is_on_floor():
		velocity.y += gravidade

	


	var direction = Input.get_axis("esquerda", "direita")
	if direction:
		velocity.x = direction * velocidade * multiplicador_dash
	else:
		velocity.x = move_toward(velocity.x, 0, velocidade)

	move_and_slide()



func andando():
	
	if is_on_floor():
		$Area2D/Alto.disabled = false
		$Area2D/Baixo.disabled = true
	
	
	
	if velocity.x < 0: $Sprite2D.speed_scale = -0.7
	elif velocity.x > 0: $Sprite2D.speed_scale = 1.2
	elif velocity.x == 0: $Sprite2D.speed_scale = 1
	
	if Input.is_action_just_pressed("baixo"):
		velocity.y += 1500
		ESTADO_MOVIMENTO = ABAIXANDO
	
	
	if Input.is_action_just_pressed("baixo") && ESTADO_PULO == no_chao:
		ESTADO_MOVIMENTO = ABAIXANDO
		$Sprite2D.play("rolando")
		particles.emitting = true
func rolando():
	if ESTADO_PULO == no_chao: $Sprite2D.play("rolando")
	
	if Input.is_action_just_pressed("baixo"):
		$Area2D/Alto.disabled = true
		$Area2D/Baixo.disabled = false
		$agachasom.play()
	if not Input.is_action_pressed("baixo"):
		ESTADO_MOVIMENTO = ANDANDO


func chao():
	
	
	if Input.is_action_pressed("pular"):
		velocity.y = pulo
		ESTADO_PULO = no_ar
		$Sprite2D.play("pulando")
		$Sprite2D.scale.x = 1
		particles.emitting = false
		$pulosom.play()
func pulando():
	if velocity.y >= 0:
		ESTADO_PULO = caindo
		

func to_caindo_socorro():
	if is_on_floor():
		$Sprite2D.scale.y = 1
		ESTADO_PULO = no_chao





func _on_area_2d_body_entered(body):
	if (body.is_in_group("tile") || body.is_in_group("tile_2")):
		print("BATEU SEU MERDA")
		Global.tapodendocabar = true
		Global.multiplicador = 1
		velocity = Vector2.ZERO
		
		
		var morte2 = morte.instantiate()
		get_viewport().get_child(0).add_child(morte2)
		morte2.transform.origin = transform.origin
		queue_free()
		
	if body.is_in_group("Upgrade"):
		print("FOI CARALHO?")
#		get_node("%TIROA").visible = false 	#BUG AQUI
		queue_free()

func _on_bounce_timeout():
		$Sprite2D.scale.y += 0.8
		$Sprite2D.scale.x += 0.5
		
func add_ghost():
	var ghost = ghost_node.instantiate()
	ghost.set_property(position, $Sprite2D.scale)
	get_tree().current_scene.add_child(ghost)
	
func _on_ghost_timer_timeout():
	add_ghost()

func dash():
	ghost_timer.start()
	var tween = get_tree().create_tween()
	tween.tween_property(self, "multiplicador_dash", 5, 0.20)
	particles.emitting = true
	$Area2D/Alto.disabled = true
	$Area2D/Baixo.disabled = true
	$CollisionShape2D.disabled = true
	particles2.emitting = true
	
	print(Global.dashes)
	
	await tween.finished
	
	if tween.finished:
		ghost_timer.stop()
		multiplicador_dash = 1
		particles.emitting = false
		$Area2D/Alto.disabled = false
		$Area2D/Baixo.disabled = false
		$CollisionShape2D.disabled = false
		particles2.emitting = false
	print(position)


func _on_pontos_timeout():
	Global.pontos += 1 * Global.multiplicador


func _on_multiplicador_timeout():
	Global.multiplicador *= 2
