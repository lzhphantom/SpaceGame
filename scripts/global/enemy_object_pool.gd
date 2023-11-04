extends Node
var enemy_pool = []  # 用于存储敌人对象实例的数组

var can_alive_enemy = -1


func _ready():
	pass

func add_enemy(enemy_instantiate):
	enemy_pool.append(enemy_instantiate)

func check_enemy_pool():
	if can_alive_enemy != -1:
		return true
	for i in range(enemy_pool.size()):
		if enemy_pool[i] != null and enemy_pool[i].health_component.deaded:
			can_alive_enemy = i
			return true
	return false

func reborn_enemy():
	var result = enemy_pool[can_alive_enemy]
	can_alive_enemy = -1
	return result

func remove_enemy(enemy):
	var enemy_index = enemy_pool.find(enemy)
	if enemy_index !=-1:
		enemy_pool.remove_at(enemy_index)
