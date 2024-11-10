extends Area2D

@onready var game_manager: Node = %game_manager

func _on_body_entered(body: Node2D) -> void:
	game_manager.add_points()
	#print("I picked up the coin")
	queue_free() 
	#pass # Replace with function body.
