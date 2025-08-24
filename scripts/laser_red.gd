extends Area2D

var speed : float = 500

func _physics_process(delta: float) -> void:
	global_position.x += speed * delta
	

func _on_area_entered(area: Area2D) -> void:
	area.died()
	queue_free()
	
func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
