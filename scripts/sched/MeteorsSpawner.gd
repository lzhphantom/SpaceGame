extends Node2D


func spawn_meteors() -> void:
	var meteor
	if MeteorObjectPool.check_meteors_pool():
		meteor = MeteorObjectPool.reborn_meteors()
		meteor.reset()
	else:
		meteor = MeteorObjectPool.add_meteors_pool()
		self.add_child(meteor)
#	var enemy_shape = new_enemy.get_node("CollisionShape2D")
#	var enemy_width = enemy_shape.shape.radius
#
	var viewport_width = get_viewport_rect().size.x
	var rand_x = randf_range(0,viewport_width)
	meteor.position.x = rand_x
	meteor.position.y = -50
