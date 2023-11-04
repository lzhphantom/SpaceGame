extends Area2D
class_name Enemy

@export var speed: float = 100
@export var score = 10
@export var max_health: float = 1
@export var clear_after_deaded: float = 2.0
@export var reward: PackedScene
@export var laser_tscn: PackedScene
var health_component: HealthComponent
# Called when the node enters the scene tree for the first time.

var implements = DamageInterface.Damageable
func _ready():
	self.health_component = HealthComponent.new(max_health)
	self.add_child(self.health_component)
	$Timer.wait_time = clear_after_deaded
	$Timer.connect("timeout",Callable(self,"free_self_and_pool"))
	
	$LaserTimer.wait_time = 2.0
	$LaserTimer.connect("timeout",Callable(self,"auto_attack"))
	$LaserTimer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if health_component.is_alive():
		self.position.y += speed * delta


func _on_area_entered(other_area):
	if other_area is Laser:
		var laser = other_area as Laser
		if health_component.is_alive() and not laser.deaded:
			if DamageInterface.node_implements_interface(self,DamageInterface.Damageable):
				health_component.get_damage(other_area.attack,Callable(self,"get_damage"))
				laser.disable()

func get_damage():
	self.disable()
	self.remove_all_lasers()
	GameState.increase_score(score)
	GameState.reduce_enemy(1)
	self.get_reward()
		
func reset():
	health_component.reset()
	self.set_visible(true)
	$Timer.stop()

func disable():
	self.set_visible(false)
	$Timer.start()

func free_self_and_pool():
	EnemyObjectPool.remove_enemy(self)
	self.queue_free()

func get_reward():
	var result = LaserConstants.random_get_upgrade()
	if result == LaserConstants.Item.Up:
		print_debug("获得奖励")
		var r
		if LaserUpgradeObjectPool.check_laser_upgrade_pool():
			r = LaserUpgradeObjectPool.reborn_laser_upgrade()
			r.reset()
		else:
			r = reward.instantiate()
			call_deferred("add_sibling",r)
			LaserUpgradeObjectPool.add_laser_upgrade_pool(r)
		r.position = self.position


func auto_attack():
	$fireAudio.play()
	var collision_shape = $CollisionShape2D
	var shape = collision_shape.shape
	var self_x = shape.radius
	var laser
	if check_laser_pool():
		laser = reborn_laser()
	else:
		laser = laser_tscn.instantiate()
		add_child(laser)
		laser_pool.append(laser)
	laser.position.y += self_x
	laser.reset()

var laser_pool: Array = []
var can_alive_laser = -1

func check_laser_pool():
	if can_alive_laser !=-1:
		return true
	for i in range(laser_pool.size()):
		if laser_pool[i] != null and laser_pool[i].deaded:
			can_alive_laser = i
			return true
	return false

func reborn_laser():
	var result = laser_pool[can_alive_laser]
	can_alive_laser = -1
	return result

func remove_laser(laser):
	var laser_index = laser_pool.find(laser)
	if laser_index != -1:
		laser_pool.remove_at(laser_index)

func remove_all_lasers():
	for item in laser_pool:
		if item != null:
			item.queue_free()
