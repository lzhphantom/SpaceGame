extends Node

var score:int = 0
var is_game_over = false
var enemy_count = 0


func reset_valuse() -> void:
	score = 0
	is_game_over = false
	enemy_count = 0

func increase_score(increase_amount:int) -> void:
	score += increase_amount

func reduce_enemy(number:int) -> void:
	enemy_count -= number
	if enemy_count < 0 :
		enemy_count = 0

func increase_enemy(number:int) -> void:
	enemy_count += number
