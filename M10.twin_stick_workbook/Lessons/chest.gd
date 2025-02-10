@tool
class_name Chest extends Area2D

var player_near_by := false

@export var possible_items: Array[Item] = []

@onready var animation_player: AnimationPlayer = %AnimationPlayer


func _ready() -> void:
	body_entered.connect(func (body: Node) -> void:
		player_near_by = true
	)
	body_exited.connect(func (body: Node) -> void:
		player_near_by = false
	)

func _get_configuration_warnings() -> PackedStringArray:
	var warnings := PackedStringArray()
	if possible_items == []:
		warnings.append("No potential pickups have been set. The chest will not loot any items.")
	return warnings

func open() -> void:
	animation_player.play("open")
