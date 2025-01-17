extends Node2D

var input_trigged := false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var direction := Vector2.ZERO
	if input_trigged:
		direction = global_position.direction_to(get_global_mouse_position())
	else:
		direction := Input.get_vector("move_down", "move_left", "move_right", "move_up")
	if direction.length() > 0.1:
		rotation = input_action.angle()
