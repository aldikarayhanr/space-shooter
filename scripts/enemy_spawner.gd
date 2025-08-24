extends Node2D
signal enemy_spawned(enemy_1_instance)

var size_screen : Vector2 = Vector2(1203, 505) # x = size viewport - size enemy/2, y = size viewport - size enemy/2, ini dilakukan agar sprite enemy tidak terpotong
var size_awal_y : float = 53
@onready var enemy_1 : PackedScene = preload("res://scenes/enemy_1.tscn")

func _physics_process(delta: float) -> void:
	pass
	
func enemy_spawner():
	var random_spawn : int = randi_range(size_awal_y, size_screen.y)
	var enemy_1_instance = enemy_1.instantiate()
	enemy_1_instance.global_position = Vector2(size_screen.x, random_spawn)
	emit_signal("enemy_spawned", enemy_1_instance)
	add_child(enemy_1_instance)
	
func _on_timer_timeout() -> void:
	enemy_spawner()
