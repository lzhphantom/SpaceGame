extends Area2D
class_name LaserUpgrade

@export var clear_after_deaded: float = 2.0
var deaded = false

func _ready():
	$Timer.wait_time = clear_after_deaded
	$Timer.connect("timeout",Callable(self,"free_self_and_pool"))


func _process(delta):
	if not self.deaded:
		self.position.y += 100*delta

func disable():
	self.deaded = true
	self.set_visible(false)
	$Timer.start()

func reset():
	self.deaded = false
	self.set_visible(true)
	$Timer.stop()

func free_self_and_pool():
	LaserUpgradeObjectPool.remove_laser_upgrade(self)
	self.queue_free()


func _on_area_entered(other_area):
	if other_area is Player:
		var player = other_area as Player
		if not self.deaded:
			self.disable()
			player.fire_upgrade()
