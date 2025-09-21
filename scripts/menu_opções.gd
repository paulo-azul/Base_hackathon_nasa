extends Control

var origem : String = ""

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
		
		"Botão_voltar":
			if origem == "jogo":
				Global.menu = "não"
				Global.tela_jogador = "cena_jogo"
			else:
				Global.menu = "não"
				Global.tela_jogador = "menu_incial"
			queue_free()
			
			
		"Botão_sair":
			get_tree().quit()
			
		
	
