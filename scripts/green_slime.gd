extends Node2D

const SPEED = 30 #Pixel speed of unit movement

# Can be negative or positive, determing in which direction movement occurs
var direction = 1

# RayCast are invisible nodes that are shot out to detect collision
@onready var rayCast_Right: RayCast2D = $rayCast_Right
@onready var rayCast_Left: RayCast2D = $rayCast_Left

# Reference to sprite animation of slime
@onready var animated_Sprite_2D: AnimatedSprite2D = $animated_Sprite_2D

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if rayCast_Right.is_colliding():
		direction = -1
		animated_Sprite_2D.flip_h = true
	elif rayCast_Left.is_colliding():
		direction = 1
		animated_Sprite_2D.flip_h = false
	
	position.x += direction *(SPEED * delta)
	#pass
