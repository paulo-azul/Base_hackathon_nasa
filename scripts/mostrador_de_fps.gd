extends Label
	
func _process(delta: float) -> void:
	if Global.mostrar_fps:
		visible = true
		text = "FPS: " + str(Engine.get_frames_per_second())
	else:
		visible = false
		text = "FPS: "
