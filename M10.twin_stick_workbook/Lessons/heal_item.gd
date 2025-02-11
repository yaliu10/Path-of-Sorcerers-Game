class_name HealItem extends Area2D

@export var heal: int = 10

func _ready() -> void:
	pass


func _on_area_entered(player: Player) -> void:
	if player != null:
		player.health += heal
