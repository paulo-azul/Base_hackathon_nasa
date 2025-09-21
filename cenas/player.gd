extends CharacterBody2D

@onready var menu_opcoes_scene := preload("res://cenas/menu_opções.tscn")
@onready var animação := $Player_anim as AnimatedSprite2D
var menu_opcoes_instance: Node = null
var direçãoX
var direçãoY
var correr := false
var ataque := false
var velocidade 



func _physics_process(delta: float) -> void:
	
	if correr == false:
		velocidade = 150
	else:
		velocidade = 300

	direçãoY = Input.get_axis("cima", "baixo")
	if direçãoY:
		velocity.y = direçãoY * velocidade
	else:
		velocity.y = move_toward(velocity.y, 0, velocidade)


	direçãoX = Input.get_axis("esquerda", "direita")
	if direçãoX:
		velocity.x = direçãoX * velocidade
	else:
		velocity.x = move_toward(velocity.x, 0, velocidade)
	
	if ataque == false:
		if direçãoX > 0:
			animação.flip_h = false
		elif direçãoX < 0: 
			animação.flip_h = true

	if Global.menu == "não":
		move_and_slide()
	
	if Input.is_action_just_pressed("esc") and Global.menu == "não":
		Global.menu = "sim"
		menu_opcoes_instance = menu_opcoes_scene.instantiate()
		get_parent().find_child("Interface").add_child(menu_opcoes_instance)
		menu_opcoes_instance.origem = "menu_incial"
		
	if Input.is_action_just_pressed("shift") and Global.menu =="não":
		correr = not correr 
	
	if Input.is_action_just_pressed("botão_esquerdo") and Global.menu =="não" and correr == false and ataque == false:
		ataque = true 
	
	_set_estado()

func _set_estado():
	
	if (animação.animation == "ataque" or animação.animation == "andar + ataque") and ataque:
		return
		
	var estado = "idle"
	
	if ataque == true:
		if direçãoX != 0 or direçãoY != 0:
			estado = "andar + ataque"
		else:
			estado = "ataque"
		
	elif direçãoX != 0 or direçãoY != 0:
		if correr == false:
				estado = "andar"
		else:
				estado = "correr"
		
	if animação.animation != estado:
		animação.play(estado)
	
		


func _on_player_anim_animation_finished() -> void:
	if animação.animation == "ataque" or animação.animation == "andar + ataque":
		ataque = false
		_set_estado()
