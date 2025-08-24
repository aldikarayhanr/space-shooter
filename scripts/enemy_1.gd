extends Area2D

signal tabrak

var speed : float = 250

func _ready() -> void:
	pass
func _physics_process(delta: float) -> void:
	global_position.x -= speed * delta

func died():
	queue_free()

func _on_body_entered(body: Node2D) -> void:
	emit_signal("tabrak")
	died()
