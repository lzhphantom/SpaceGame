extends Node

var score = 0
var is_game_over = false
var enemy_count = 0


func reset_valuse():
	score = 0
	is_game_over = false
	enemy_count = 0

func increase_score(increase_amount):
	score += increase_amount

func reduce_enemy(number):
	enemy_count -= number
	if enemy_count < 0 :
		enemy_count = 0

func increase_enemy(number):
	enemy_count += number
