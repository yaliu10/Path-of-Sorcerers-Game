class_name Bullet extends Area2D

@export var speed := 700.0

var _distance_traveled := 0.0
var max_range := 900.0

func _physics_process(delta: float) -> void:
	var distance := speed * delta
	var direction := Vector2.RIGHT.rotated(rotation) * distance
	
	position += direction
	
	_distance_traveled += distance
	if _distance_traveled >= max_range:
		_destroy()

func _destroy():
	queue_free()
