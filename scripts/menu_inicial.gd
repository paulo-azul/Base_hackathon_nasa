extends Control

@onready var timer_som: Timer = $Som_botão/Timer_som
@onready var som_botão: AudioStreamPlayer = $Som_botão
@onready var menu_opcoes_scene := preload("res://cenas/menu_opções.tscn")
@onready var som_out: AudioStreamPlayer = $som_out
var menu_opcoes_instance: Node = null

func mouse_interaction(button: Button, state: String) -> void:
	match state:
		"exited":
			button.modulate.a = 1.0
			
		"entered":
			button.modulate.a = 0.5
		

func _ready() -> void:
	for button in get_tree().get_nodes_in_group("botão_redirecionar"):
		button.connect("pressed", Callable(self, "_on_button_pressed").bind(button))
		
func _on_button_pressed(button: Button) -> void:
	
	match button.name:
		
		"Botão_crédito_Paulo":
			som_botão.play()
			var _redirecionar_linkedin = OS.shell_open("https://www.linkedin.com/in/paulo-teles-serra-azul-1265b3351/")
		
		"Botão_jogar":
			som_botão.play()
			await get_tree().create_timer(0.5).timeout
			Global.tela_jogador = "cena_jogo"
			Global.menu = "não"
			var _jogo = get_tree().change_scene_to_file("res://cenas/jogo.tscn")
		
		"Botão_opções":
			som_botão.play()
			menu_opcoes_instance = menu_opcoes_scene.instantiate()
			get_tree().get_root().add_child(menu_opcoes_instance)
			menu_opcoes_instance.origem = "menu_incial"
		
		"Botão_sair":
			som_out.play()
			await get_tree().create_timer(0.6).timeout
			get_tree().quit()
			
			
		
	
