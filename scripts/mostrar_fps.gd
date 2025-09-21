extends CheckButton

@onready var mostrar_fps: CheckButton = $"."

func _ready() -> void:
	mostrar_fps.toggled.connect(_mostrar_FPS_botão)
	if Global.mostrar_fps != true:
		mostrar_fps.button_pressed = false
	else:
		mostrar_fps.button_pressed = true
	
func _mostrar_FPS_botão(pressed: bool) -> void:
	Global.mostrar_fps = pressed
	print(Global.mostrar_fps)
	
