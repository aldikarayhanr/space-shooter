extends Node2D

var lives : int = 3
@onready var player: CharacterBody2D = $Player

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	pass

func _on_enemy_spawner_enemy_spawned(enemy_1_instance: Variant) -> void:
	enemy_1_instance.connect("tabrak", on_tabrak)

func on_tabrak():
	lives -= 1
	if lives == 0:
		print("game over")
		player.died()
	else:
		print(lives)
		
