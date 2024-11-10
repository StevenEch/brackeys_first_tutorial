extends killzone

var DAMAGE = 2

func _on_body_entered(body: Node2D) -> void:
	if inmune_timer.is_stopped():
		body.takingDamage = true
		body.takeDamage(DAMAGE)
		inmune_timer.start()
	if (body.isAlive() == false):
		Engine.time_scale = 0.7
		timer.start()

	# In case I want mario death
	#body.velocity.y = body.JUMP_VELOCITY
	#body.get_node("CollisionShape2D").queue_free()
	
func _on_timer_timeout() -> void:
	Engine.time_scale = 1
	get_tree().reload_current_scene()
