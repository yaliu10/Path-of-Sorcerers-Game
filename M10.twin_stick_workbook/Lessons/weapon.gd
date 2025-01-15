extends Node2D


func _shoot():
	print("Spawned Bullet")

func _physics_process(delta: float) -> void:
	if Input.is_action_just_pressed("shoot"):
		_shoot()
