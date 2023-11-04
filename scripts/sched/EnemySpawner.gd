extends Node2D


@export var enemy_tscn: PackedScene

# every 1 sec -> spawn new enemy
func spawn_enemy_ship():
	var new_enemy
	if EnemyObjectPool.check_enemy_pool():
		new_enemy = EnemyObjectPool.reborn_enemy()
		new_enemy.reset()
	else:
		new_enemy = enemy_tscn.instantiate()
		self.add_child(new_enemy)
		EnemyObjectPool.add_enemy(new_enemy)
	var enemy_shape = new_enemy.get_node("CollisionShape2D")
	var enemy_width = enemy_shape.shape.radius

	var viewport_width = get_viewport_rect().size.x
	var rand_x = randf_range(enemy_width,viewport_width-enemy_width)
	new_enemy.position.x = rand_x
	new_enemy.position.y = -50
	new_enemy.score = 20
#	new_enemy.reset()
	GameState.increase_enemy(1)
