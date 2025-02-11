class_name Item extends Resource

@export var display_name := ""
@export var texture: Texture2D = null
@export var sound_on_pickup: AudioStream = null


# Called when the node enters the scene tree for the first time.
func use(player: Player) -> void:
	pass
