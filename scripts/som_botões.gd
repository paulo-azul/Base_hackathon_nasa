extends AudioStreamPlayer

func _ready() -> void:
	Global.volume_settings_changed.connect(update_volume)
	update_volume()

func update_volume():
	var volume_geral_linear = Global.som_geral / 100.0
	var volume_efeitos_linear = Global.efeitos / 100.0
	
	var volume_final_linear = volume_geral_linear * volume_efeitos_linear
	
	volume_db = linear_to_db(volume_final_linear)
