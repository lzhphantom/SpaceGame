extends Area2D
class_name AttackIntervalUpgrade

@export var clear_after_deaded: float = 2.0
@export var reward_attack_interval: float = 0.1
var deaded = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = clear_after_deaded
	$Timer.connect("timeout",Callable(self,"free_self_and_pool"))


# Called every frame. 'delta' is the elapsed time since the previous frame.
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
#	LaserUpgradeObjectPool.remove_laser_upgrade(self)
	self.queue_free()


func _on_area_entered(other_area):
	if other_area is Player:
		var player = other_area as Player
		if not self.deaded:
			self.disable()
			player.add_attack_interval(reward_attack_interval)
