extends Area2D
class_name killzone

@onready var timer: Timer = $Timer
@onready var inmune_timer: Timer = $inmuneTimer

func _on_body_entered(body: Node2D) -> void:
	Engine.time_scale = 0.5
	timer.start()

	# In case I want mario death
	#body.velocity.y = body.JUMP_VELOCITY
	#body.get_node("CollisionShape2D").queue_free()
	
func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
