extends Node2D


@export var enemy_tscn: PackedScene

# every 1 sec -> spawn new enemy
func spawn_enemy_ship() -> void:
	var dict = EnemyConstants.get_enemy_level()
#	print_debug(dict)
	var new_enemy: Enemy
	if EnemyObjectPool.check_enemy_pool():
		new_enemy = EnemyObjectPool.reborn_enemy()
		new_enemy.reset()
	else:
		new_enemy = enemy_tscn.instantiate()
		self.add_child(new_enemy)
		EnemyObjectPool.add_enemy(new_enemy)
	
	new_enemy.speed = dict["speed"]
	new_enemy.score = dict["score"]
	new_enemy.max_health = dict["max_health"]
	new_enemy.clear_after_deaded = dict["clear_after_deaded"]
	new_enemy.set_shape(dict["path"])
	
	var enemy_shape = new_enemy.get_node("CollisionShape2D")
	var enemy_width = enemy_shape.shape.radius

	var viewport_width = get_viewport_rect().size.x
	var rand_x = randf_range(enemy_width,viewport_width-enemy_width)
	new_enemy.position.x = rand_x
	new_enemy.position.y = -50
#	new_enemy.score = 20
	new_enemy.reset()
	GameState.increase_enemy(1)
