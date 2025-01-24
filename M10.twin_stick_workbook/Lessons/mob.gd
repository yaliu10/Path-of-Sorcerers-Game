class_name Mob extends CharacterBody2D

var _player: Player = null

@onready var detection_area: Area2D = %DetectionArea

@export var max_speed := 500.0
@export var acceleration := 1000.0

func _on_area_2d_body_entered(body: Node2D) -> void:
		if body is Player:
			_player = body

func _on_area_2d_body_exited(body: Node2D) -> void:
	if body is Player:
			_player = null

func _physics_process(delta: float) -> void:
	if _player == null:
		velocity = velocity.move_toward(Vector2.ZERO, acceleration * delta)
	else:
		var direction := global_position.direction_to(_player.global_position)
		var distance := global_position.distance_to(_player.global_position)
		var speed := max_speed if distance > 100 else max_speed * distance / 100
		var desired_velocity := direction * speed
		velocity = velocity.move_toward(desired_velocity, acceleration * delta)
	move_and_slide()
