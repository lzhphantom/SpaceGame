extends Label

func _process(_delta):
	self.text = "Enemy:" + str(GameState.enemy_count)
