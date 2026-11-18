extends CanvasLayer
## Marcador de la partida (plan P2). Solo muestra: el estado vive en Game.

const CORAZON_LLENO: Texture2D = preload("res://Assets/Art/Heart/Corazon.png")
const CORAZON_VACIO: Texture2D = preload("res://Assets/Art/Heart/Corazon_vacio.png")

@onready var _puntos: Label = %Puntos
@onready var _tiempo: Label = %Tiempo
@onready var _corazones: HBoxContainer = %Corazones
@onready var _combo: Label = %Combo
@onready var _corazon_lleno: TextureRect = %Corazon_lleno


@export var color_lleno := Color("e63946")
@export var color_vacio := Color(0.35, 0.35, 0.35, 0.5)

var _corazon_vacio : TextureRect

func _ready() -> void:

	Game.score_changed.connect(_actualizar_puntos)
	Game.lives_changed.connect(_actualizar_vidas)
	Game.time_changed.connect(_actualizar_tiempo)
	Game.combo_changed.connect(_actualizar_combo)
	_actualizar_puntos(Game.score)
	_actualizar_vidas(Game.lives)
	_actualizar_combo(Game.combo)
	_actualizar_tiempo(Game.time_played)


func _actualizar_puntos(total: int) -> void:
	_puntos.text = "PUNTOS  %06d" % total


func _actualizar_tiempo(segundos: float) -> void:
	var total := int(segundos)
	_tiempo.text = "TIEMPO  %02d:%02d" % [total / 60, total % 60]



func _actualizar_vidas(vidas: int) -> void:
	for i in _corazones.get_child_count():
		var corazon := _corazones.get_child(i) as TextureRect
		corazon.texture = CORAZON_LLENO if i < vidas else CORAZON_VACIO

func _actualizar_combo(combo: int) -> void:
	var combo_total := int(combo)
	_combo.text = "COMBOx %02d" % combo
