class_name Player extends CharacterBody2D

var health: int = 0 : set = set_health

@export var max_speed := 600.0
@export var max_health := 100

@onready var collision_shape_2d: CollisionShape2D = %CollisionShape2D
@onready var health_bar: ProgressBar = %HealthBar

func _ready() -> void:
	health = max_health
	health_bar.value = health
	
func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * max_speed
	move_and_slide()

func set_health(new_health: int) -> void:
	var previous_health := health
	health = clampi(new_health, 0, max_health)
	health_bar.value = health
	print("Player health changed from", previous_health, "to", health)
	if health == 0:
		die()

func die() -> void:
	queue_free()
