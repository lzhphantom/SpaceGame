extends Area2D
class_name Laser

@export var direction: FlyDirectionComponent.FlightDirection
var fly_direction: FlyDirectionComponent
var attack: AttackComponent
@export var clear_after_deaded: float = 2.0
var deaded = false
var can_reborn = true
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = clear_after_deaded
	$Timer.connect("timeout",Callable(self,"free_self_and_pool"))
	
	var data = LaserConstants.LASER_DICT_BLUE[LaserConstants.play1_current_laser_level]
	$LaserGrphic.set_texture(load(data["path"]))
	self.fly_direction = FlyDirectionComponent.new(LaserConstants.play1_current_speed,direction)
	self.add_child(self.fly_direction)
	self.attack = AttackComponent.new(data["attack"])
	self.add_child(self.attack)
	self.clear_after_deaded = data["clear_after_deaded"]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not self.deaded:
		self.fly_direction.move(delta)
		if self.position.y<=0:
			self.disable()

func disable():
	self.deaded = true
	self.set_visible(false)
	$Timer.start()

func reset():
	self.deaded = false
	self.fly_direction.speed = LaserConstants.play1_current_speed
	self.set_visible(true)
	$Timer.stop()

func free_self_and_pool():
	LaserObjectPool.remove_laser(self)
	self.queue_free()
