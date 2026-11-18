extends Control

func _on_boton_jugar_pressed() -> void:
# Cambia "res://escenas/nivel.tscn" por la ruta de tu escena de juego
	get_tree().change_scene_to_file("res://Assets/Scene/Scene_1.tscn")

func _on_boton_salir_pressed() -> void:
	# Cierra el juego
	get_tree().quit()
