extends Node2D

var is_using_gamepad := false

@onready var weapon_anchor: Marker2D = %WeaponAnchor

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var cursor_position = get_global_mouse_position()
	var rotation_angle = global_position.angle_to_point(cursor_position)
	rotation = rotation_angle

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseMotion or event is InputEventKey:
		is_using_gamepad = false
	elif event is InputEventJoypadButton or event is InputEventJoypadMotion:
		is_using_gamepad = true
