extends Node2D

@export var padrao1 : TileMap
@export var padrao2 : TileMap

@onready var fadein = $AnimationPlayer

var p1 = preload("res://cenas/tile_.tscn")
var p2 = preload("res://cenas/tile_2.tscn")
var p3 = preload("res://cenas/tile_9.tscn")
var p4 = preload("res://cenas/tile_4.tscn")
var p5 = preload("res://cenas/tile_5.tscn")
var p6 = preload("res://cenas/tile_6.tscn")
var p7 = preload("res://cenas/tile_7.tscn")
var p8 = preload("res://cenas/tile_8.tscn")
var p9 = preload("res://cenas/tile_9.tscn")
var p10 = preload("res://cenas/tile_10.tscn")


var rng = RandomNumberGenerator.new()

func _ready():
	fadein.play("fade_in")
	Global.dashes = 0
	Global.pontos = 1

func _process(delta):
	
	
	
	padrao1.transform.origin.x -= 5
	padrao2.transform.origin.x -= 5

	
	if (padrao1.transform.origin.x<=-720):

		var numero = rng.randi_range(1,10)
		var novopadrao
		if numero==1:
			novopadrao = p1.instantiate()
		elif numero==2:
			novopadrao = p2.instantiate()
		elif numero==3:
			print(3333333333)
			novopadrao = p3.instantiate()
		elif numero==4:
			print(4444444444444444)
			novopadrao = p4.instantiate()
		elif numero==5:
			
			novopadrao = p5.instantiate()
		elif numero==6:
			
			novopadrao = p6.instantiate()
		elif numero==7:
			
			novopadrao = p7.instantiate()
		elif numero==8:
			
			novopadrao = p8.instantiate()
		elif numero==9:
			
			novopadrao = p9.instantiate()
		elif numero==10:
			
			novopadrao = p10.instantiate()

		novopadrao.transform.origin.x = 720
		add_child(novopadrao)
		padrao1.queue_free() 
		padrao1 = novopadrao

	if (padrao2.transform.origin.x<=-720):

		var numero = rng.randi_range(1,10)
		var novopadrao
		if numero==1:
			novopadrao = p1.instantiate()
		elif numero==2:
			novopadrao = p2.instantiate()
		elif numero==3:
			print(3333333333)
			novopadrao = p3.instantiate()
		elif numero==4:
			print(4444444444444444)
			novopadrao = p4.instantiate()
		elif numero==5:
			
			novopadrao = p5.instantiate()
		elif numero==6:
			
			novopadrao = p6.instantiate()
		elif numero==7:
			
			novopadrao = p7.instantiate()
		elif numero==8:
			
			novopadrao = p8.instantiate()
		elif numero==9:
			
			novopadrao = p9.instantiate()
		elif numero==10:
			novopadrao = p10.instantiate()

		novopadrao.transform.origin.x = 720
		add_child(novopadrao)
		padrao2.queue_free()
		padrao2 = novopadrao
		
##################################################################

	if Global.tapodendocabar == true:
		$AnimationPlayer.play("fade_in botão")
		
	if Global.dashes == 4:
		$ProgressBar/AnimatedSprite2D.play("chei")
	if Global.dashes == 3:
		$ProgressBar/AnimatedSprite2D.play("chei2")
	if Global.dashes == 2:
		$ProgressBar/AnimatedSprite2D.play("chei3")
	if Global.dashes == 1:
		$ProgressBar/AnimatedSprite2D.play("chei4")
	if Global.dashes == 0:
		$ProgressBar/AnimatedSprite2D.play("cabo")
		

##################################################################


var dashspawn = preload("res://cenas/dashup.tscn")

func _on_spawndash_timeout():
	var pos = Vector2(randi_range(760,760),randi_range(60,250))
	var dash = dashspawn.instantiate()
	dash.transform.origin = pos
	add_child(dash)
	print("tomoulis?")
	
