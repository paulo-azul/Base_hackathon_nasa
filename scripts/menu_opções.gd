extends Control

var origem : String = ""
@onready var timer_som_botões: Timer = $som_botões/Timer_somBotões
@onready var som_botões: AudioStreamPlayer = $som_botões
@onready var som_out: AudioStreamPlayer = $som_out

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
			som_out.play()
			await get_tree().create_timer(0.5).timeout
			if origem == "jogo":
				Global.menu = "não"
				Global.tela_jogador = "cena_jogo"
			else:
				Global.menu = "não"
				Global.tela_jogador = "menu_incial"
			queue_free()
			
			
		"Botão_sair":
			som_out.play()
			await get_tree().create_timer(0.5).timeout
			get_tree().quit()
			
		
	


func _on_timer_som_botões_timeout() -> void:
	som_botões.stop()
