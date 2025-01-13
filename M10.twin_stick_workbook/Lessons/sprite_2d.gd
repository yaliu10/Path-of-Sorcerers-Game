extends Sprite2D

const PLAYER_DOWN = preload("res://player/godot_bottom.png")
const PLAYER_DOWN_RIGHT = preload("res://player/godot_bottom_right.png")
const PLAYER_RIGHT = preload("res://player/godot_right.png")
const PLAYER_UP = preload("res://player/godot_up.png")
const PLAYER_UP_RIGHT = preload("res://player/godot_up_right.png")

const UP_RIGHT = Vector2.UP + Vector2.RIGHT
const UP_LEFT = Vector2.UP + Vector2.LEFT
const DOWN_RIGHT = Vector2.DOWN + Vector2.RIGHT
const DOWN_LEFT = Vector2.DOWN + Vector2.LEFT

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("move_left", "move_right", "move_up", "move_down")
	
	var direction_discrete := direction.sign()
	match direction_discrete:
		Vector2.RIGHT, Vector2.LEFT:
			texture = PLAYER_RIGHT
		Vector2.UP:
			texture = PLAYER_UP
		Vector2.DOWN:
			texture = PLAYER_DOWN
		UP_RIGHT, UP_LEFT:
			texture = PLAYER_UP_RIGHT
		DOWN_RIGHT, DOWN_LEFT:
			texture = PLAYER_DOWN_RIGHT

	if direction_discrete.length() > 0:
		flip_h = direction.x < 0.0
