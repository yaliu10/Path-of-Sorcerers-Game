extends Node2D

@export var bullet_scene: PackedScene = preload("res://Lessons/bullet.tscn")
@export_range(100.0, 2000.0, 1.0) var max_range := 2000
@export_range(100.0, 3000.0, 1.0) var max_bullet_speed := 1150
@export_range(0, 360, 0.1, "radians_as_degrees") var angle:= PI / 12.0

func _shoot():
	var bullet: Node = bullet_scene.instantiate()
	get_tree().current_scene.add_child(bullet)
	bullet.global_position = global_position
	bullet.global_rotation = global_rotation
	bullet.max_range = max_range
	bullet.speed = max_bullet_speed
	bullet.rotation += randf_range(-angle / 2.0, angle / 2.0)
	

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		_shoot()
