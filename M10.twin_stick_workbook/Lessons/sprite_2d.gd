extends Sprite2D

const PLAYER_DOWN = preload("res://player/godot_bottom.png")
const PLAYYER_DOWN_Right = preload("res://player/godot_bottom_right.png")
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
			Sprite2D.texture = PLAYER_RIGHT
		Vector2.UP:
			Sprite2D.texture = PLAYER_UP
		Vector2.DOWN:
			Sprite2D.texture = PLAYER_DOWN
		UP_RIGHT, UP_LEFT:
			Sprite2D.texture = PLAYER_UP_RIGHT
		DOWN_RIGHT, DOWN_LEFT:
			Sprite2D.texture = PLAYER_UP_RIGHT

	if direction_discrete.length() > 0:
		Sprite2D.flip_h = direction.x < 0.0
