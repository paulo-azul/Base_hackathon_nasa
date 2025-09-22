extends VBoxContainer

@onready var som_geral: HSlider = $"Som geral"
@onready var musica: HSlider = $Musica
@onready var efeitos: HSlider = $Efeitos


func _ready() -> void:
	Global.volume_settings_changed.connect(update_volume_bar)
	update_volume_bar()



func _process(delta: float) -> void:
	pass


func _on_som_geral_value_changed(value: float) -> void:
	Global.som_geral = som_geral.value
	Global.volume_settings_changed.emit()


func _on_musica_value_changed(value: float) -> void:
	Global.músicas = musica.value
	Global.volume_settings_changed.emit()


func _on_efeitos_value_changed(value: float) -> void:
	Global.efeitos = efeitos.value
	Global.volume_settings_changed.emit()

func update_volume_bar():
	som_geral.value = Global.som_geral
	musica.value = Global.músicas
	efeitos.value = Global.efeitos
