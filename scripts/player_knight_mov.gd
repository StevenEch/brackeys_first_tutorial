extends CharacterBody2D

@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

const SPEED = 100.0
const JUMP_VELOCITY = -300.0

var HEALTH = 3
var takingDamage = false

func noDamageAnimation() -> bool: # Return bool where
	if (!animated_sprite_2d.animation == "hit" # if animation is not "hit"
	|| animated_sprite_2d.animation == "hit" # if animation is "hit" AND
	&& !animated_sprite_2d.is_playing()): # is not playing
		return true
	else: 
		return false
		
func takeDamage(damage: int):
		animated_sprite_2d.play("hit")
		HEALTH -= damage
		takingDamage = false

func isAlive() -> bool:
	if HEALTH <= 0:
		velocity.x = 0
		if animated_sprite_2d.animation != "death":
			animated_sprite_2d.stop()
			animated_sprite_2d.play("death")
		return false
	else:
		return true

func _physics_process(delta: float) -> void:
	var isAliveVar = HEALTH > 0
	if not is_on_floor():
		velocity += get_gravity() * delta

	if isAliveVar:
		# Handle jump.
		if Input.is_action_just_pressed("jump") and is_on_floor():
			velocity.y = JUMP_VELOCITY

		# Get the input direction and handle the movement/deceleration. -1, 0, 1
		var direction := Input.get_axis("move_Left", "move_Right")
		
		# Flip sprite
		if direction > 0:
			animated_sprite_2d.flip_h = false # Facing right
		elif direction < 0:
			animated_sprite_2d.flip_h = true # Facing left

		# Play animations
		if is_on_floor() && noDamageAnimation():
			if direction == 0:
				animated_sprite_2d.play("idleKnight")
			else:
				animated_sprite_2d.play("run")
		elif velocity.y < 0 && noDamageAnimation():
			animated_sprite_2d.play("jump")

		# Apply movement
		if direction:
			velocity.x = direction * SPEED
		else:
			velocity.x = move_toward(velocity.x, 0, SPEED)
		
	move_and_slide()
