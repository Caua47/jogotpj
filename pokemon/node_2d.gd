extends Control

@onready var pikachu: CharacterBody2D = $Node2D/Pikachu
@onready var Ratata: CharacterBody2D = $Node2D/Ratata
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_button_button_down() -> void:
	pikachu.ataque_rapido(Ratata)


func _on_button_2_button_down() -> void:
	pikachu.choque_do_trovao(Ratata)


func _on_button_3_button_down() -> void:
	pikachu.esquiva(Ratata)


func _on_button_4_button_down() -> void:
	pikachu.trovao(Ratata)


func _on_button_5_button_down() -> void:
	print("Você fugiu")
	get_tree().quit()
