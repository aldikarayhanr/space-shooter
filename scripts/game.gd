extends Node2D

var lives : int = 3
@onready var player: CharacterBody2D = $Player
@onready var hud: Control = $UI/HUD
@onready var ui: CanvasLayer = $UI

func _ready() -> void:
	pass

func _physics_process(delta: float) -> void:
	update_hud()

func _on_enemy_spawner_enemy_spawned(enemy_1_instance: Variant) -> void:
	enemy_1_instance.connect("tabrak", on_tabrak)

func on_tabrak():
	lives -= 1
	if lives == 0:
		print("game over")
		player.died()
		game_over()
	else:
		print(lives)

func update_hud():
	hud.get_node("Lives").text = "Lives = " + str(lives)

func game_over():
	var game_over_screen : PackedScene = load("res://scenes/game_over.tscn")
	var game_over_instantiate = game_over_screen.instantiate()
	ui.add_child(game_over_instantiate)
	
	
