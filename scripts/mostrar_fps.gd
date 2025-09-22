extends CheckButton

@onready var mostrar_fps: CheckButton = $"."
@onready var som_botões: AudioStreamPlayer = $"../som_botões"
@onready var timer_som_botões: Timer = $"../som_botões/Timer_somBotões"
@onready var som_out: AudioStreamPlayer = $"../som_out"

var audio := "ent"

func _ready() -> void:
	mostrar_fps.toggled.connect(_mostrar_FPS_botão)
	if Global.mostrar_fps != true:
		mostrar_fps.button_pressed = false
	else:
		mostrar_fps.button_pressed = true
	
func _mostrar_FPS_botão(pressed: bool) -> void:
	Global.mostrar_fps = pressed
	if audio == "ent":
		som_botões.play()
		audio = "out"
	else:
		som_out.play()
		audio = "ent"
	
	
