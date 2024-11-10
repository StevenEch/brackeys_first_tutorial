extends Node2D

@onready var player_knight: CharacterBody2D = $"../../../player_Node/player_Knight"
@onready var health_bar: AnimatedSprite2D = $health_bar

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	match player_knight.HEALTH:
		1:
			health_bar.play("oneHealth")
		2:
			health_bar.play("twoHealth")
		3:
			health_bar.play("threeHealth")
