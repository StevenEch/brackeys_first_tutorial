extends Node

var score = 0
@onready var coin_display: Label = $"../user_interface/CanvasLayer/coin_display"

func add_points():
	score += 1
	coin_display.text = "Coins: " + str(score)
