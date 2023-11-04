extends Label

func _process(_delta):
	if GameState.is_game_over:
		self.visible = true
	if Input.is_action_just_pressed("ui_accept") and GameState.is_game_over:
		get_parent().get_parent().get_tree().reload_current_scene()
		GameState.reset_valuse()
