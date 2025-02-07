class_name HealingItem extends Item

@export var healing_amount := 1

func use(player: Player) -> void:
	player.health += healing_amount
