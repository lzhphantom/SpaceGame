extends Area2D
class_name Player

@export var laser_tscn: PackedScene
@export var max_health: float = 10.0
var health_component: HealthComponent
# Called when the node enters the scene tree for the first time.
func _ready():
	health_component = HealthComponent.new(max_health)
	self.add_child(health_component)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	var collision_shape = $CollisionShape2D
	var shape = collision_shape.shape
	var self_x = shape.radius
	var viewport_width = get_viewport_rect().size.x
	var moust_position = get_global_mouse_position()
	
	if moust_position.x>=self_x and moust_position.x<=viewport_width-self_x:
		self.position.x = moust_position.x
	elif moust_position.x<self_x:
		self.position.x = self_x
	elif moust_position.x>viewport_width - self_x:
		self.position.x = viewport_width - self_x
	
	var laser
	if Input.is_action_just_pressed("fire"):
		if LaserObjectPool.check_laser_pool():
			laser = LaserObjectPool.reborn_laser()
		else:
			laser = laser_tscn.instantiate()
			add_sibling(laser)
			LaserObjectPool.add_laser_pool(laser)
		laser.position.x = self.position.x
		laser.position.y = self.position.y - self_x
		laser.reset()


func _on_area_entered(other_area):
	if other_area is Enemy:
		var enemy = other_area as Enemy
		if not enemy.health_component.deaded:
			var enemyImpact = AttackComponent.new(enemy.health_component.health)
			health_component.get_damage(enemyImpact,Callable(self,"game_over"))
			enemy.disable()
	
	if other_area is LaserEnemy:
		var laser_enemy = other_area as LaserEnemy
		health_component.get_damage(laser_enemy.attack,Callable(self,"game_over"))
		laser_enemy.disable()
	print_debug(health_component.health)

func game_over():
	self.queue_free()
	GameState.is_game_over = true

func fire_upgrade():
	LaserObjectPool.upgrade_laser()
	LaserConstants.play1_current_laser_level = LaserConstants.LASER_DICT_BLUE[LaserConstants.play1_current_laser_level]["next_level"]
	
