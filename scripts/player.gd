extends CharacterBody2D

var speed : float = 300
var ujung_kanan_player : float = 55
@onready var laser_scene : PackedScene = preload("res://scenes/laser_red.tscn")
@onready var laser_container: Node = $Laser_Container
@onready var laser_timer: Timer = $Laser_Timer

func _physics_process(delta: float) -> void:
	movement(delta)
	if Input.is_action_pressed("Shoot") and laser_timer.is_stopped():
		shoot_laser()
	
func movement(delta):
	if Input.is_action_pressed("Up"):
		global_position.y -= speed*delta
	if Input.is_action_pressed("Down"):
		global_position.y += speed*delta
	if Input.is_action_pressed("Right"):
		global_position.x += speed*delta
	if Input.is_action_pressed("Left"):
		global_position.x -= speed*delta
	
	global_position.x = clampf(global_position.x, 0, 1152.0)
	global_position.y = clampf(global_position.y, 0, 648.0)

func shoot_laser():
	laser_timer.start()
	var laser_instance = laser_scene.instantiate()
	laser_instance.global_position.x = global_position.x + ujung_kanan_player
	laser_instance.global_position.y = global_position.y
	laser_container.add_child(laser_instance)

func died():
	queue_free()
	
