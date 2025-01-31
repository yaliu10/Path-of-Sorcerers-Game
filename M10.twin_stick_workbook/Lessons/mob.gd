class_name Mob extends CharacterBody2D

var _player: Player = null

@onready var detection_area: Area2D = %DetectionArea
@onready var hit_box: Area2D = %HitBox

@export var max_speed := 500.0
@export var acceleration := 1000.0
@export var health := 15: set = set_health
@export var damage := 0

func _ready() -> void:
	detection_area.body_entered.connect(func(body: Node) -> void:
		if body is Player:
			_player = body
	)
	detection_area.body_exited.connect(func(body: Node) -> void:
		if body is Player:
			_player = null
	)
	hit_box.body_entered.connect(func (body: Node) -> void:
		if body is Player:
			body.health -= damage
	)

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

func set_health(new_health: int) -> void:
	health = new_health
	if health == 0:
		die()

func die() -> void:
	queue_free()
