extends Node

enum ENEMY_COLOR{
	BLACK,BLUE,GREEN,RED
}

const ENEMY_LEVEL_1 = {
	ENEMY_COLOR.BLACK:{"path":"res://assets/PNG/Enemies/enemyBlack1.png","speed":100.0,"score":20,"max_health":1,"clear_after_deaded":2.0},
	ENEMY_COLOR.BLUE:{"path":"res://assets/PNG/Enemies/enemyBlue1.png","speed":100.0,"score":20,"max_health":1,"clear_after_deaded":2.0},
	ENEMY_COLOR.GREEN:{"path":"res://assets/PNG/Enemies/enemyGreen1.png","speed":100.0,"score":20,"max_health":1,"clear_after_deaded":2.0},
	ENEMY_COLOR.RED:{"path":"res://assets/PNG/Enemies/enemyRed1.png","speed":100.0,"score":20,"max_health":1,"clear_after_deaded":2.0},
}

const ENEMY_LEVEL_2 = {
	ENEMY_COLOR.BLACK:{"path":"res://assets/PNG/Enemies/enemyBlack2.png","speed":120.0,"score":30,"max_health":2,"clear_after_deaded":2.0},
	ENEMY_COLOR.BLUE:{"path":"res://assets/PNG/Enemies/enemyBlue2.png","speed":120.0,"score":30,"max_health":2,"clear_after_deaded":2.0},
	ENEMY_COLOR.GREEN:{"path":"res://assets/PNG/Enemies/enemyGreen2.png","speed":120.0,"score":30,"max_health":2,"clear_after_deaded":2.0},
	ENEMY_COLOR.RED:{"path":"res://assets/PNG/Enemies/enemyRed2.png","speed":120.0,"score":30,"max_health":2,"clear_after_deaded":2.0},
}

const ENEMY_LEVEL_3 = {
	ENEMY_COLOR.BLACK:{"path":"res://assets/PNG/Enemies/enemyBlack3.png","speed":100.0,"score":40,"max_health":4,"clear_after_deaded":2.0},
	ENEMY_COLOR.BLUE:{"path":"res://assets/PNG/Enemies/enemyBlue3.png","speed":100.0,"score":40,"max_health":4,"clear_after_deaded":2.0},
	ENEMY_COLOR.GREEN:{"path":"res://assets/PNG/Enemies/enemyGreen4.png","speed":100.0,"score":40,"max_health":4,"clear_after_deaded":2.0},
	ENEMY_COLOR.RED:{"path":"res://assets/PNG/Enemies/enemyRed3.png","speed":100.0,"score":40,"max_health":4,"clear_after_deaded":2.0},
}

const ENEMY_LEVEL_4 = {
	ENEMY_COLOR.BLACK:{"path":"res://assets/PNG/Enemies/enemyBlack4.png","speed":100.0,"score":50,"max_health":16,"clear_after_deaded":2.0},
	ENEMY_COLOR.BLUE:{"path":"res://assets/PNG/Enemies/enemyBlue4.png","speed":100.0,"score":50,"max_health":16,"clear_after_deaded":2.0},
	ENEMY_COLOR.GREEN:{"path":"res://assets/PNG/Enemies/enemyGreen4.png","speed":100.0,"score":50,"max_health":16,"clear_after_deaded":2.0},
	ENEMY_COLOR.RED:{"path":"res://assets/PNG/Enemies/enemyRed4.png","speed":100.0,"score":50,"max_health":16,"clear_after_deaded":2.0},
}

const ENEMY_LEVEL_5 = {
	ENEMY_COLOR.BLACK:{"path":"res://assets/PNG/Enemies/enemyBlack5.png","speed":100.0,"score":100,"max_health":32,"clear_after_deaded":2.0},
	ENEMY_COLOR.BLUE:{"path":"res://assets/PNG/Enemies/enemyBlue5.png","speed":100.0,"score":100,"max_health":32,"clear_after_deaded":2.0},
	ENEMY_COLOR.GREEN:{"path":"res://assets/PNG/Enemies/enemyGreen5.png","speed":100.0,"score":100,"max_health":32,"clear_after_deaded":2.0},
	ENEMY_COLOR.RED:{"path":"res://assets/PNG/Enemies/enemyRed5.png","speed":100.0,"score":100,"max_health":32,"clear_after_deaded":2.0},
}

const ENEMY_LEVEL_GROUP:Array = [ENEMY_LEVEL_1,ENEMY_LEVEL_2,ENEMY_LEVEL_3,ENEMY_LEVEL_4,ENEMY_LEVEL_5]
var random_generator = RandomNumberGenerator.new()
func _ready():
	random_generator.randomize()
func get_enemy_level() -> Dictionary:
	var index = random_generator.randi_range(0,ENEMY_LEVEL_GROUP.size()-1)
	var index2 = random_generator.randi_range(0,ENEMY_LEVEL_GROUP[index].size()-1)
	return ENEMY_LEVEL_GROUP[index][index2]
