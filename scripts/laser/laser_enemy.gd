extends Area2D
class_name LaserEnemy

@export var speed:float =100.0
@export var direction: FlyDirectionComponent.FlightDirection
var fly_direction: FlyDirectionComponent
var attack: AttackComponent
@export var clear_after_deaded: float = 2.0
var deaded = false
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = clear_after_deaded
	$Timer.connect("timeout",Callable(self,"free_self_and_pool"))
	
	self.fly_direction = FlyDirectionComponent.new(speed,direction)
	self.add_child(self.fly_direction)
	self.attack = AttackComponent.new(1.0)
	self.add_child(self.attack)
	self.clear_after_deaded = 1.0


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
	self.set_visible(true)
	$Timer.stop()

func free_self_and_pool():
	get_parent().remove_laser(self)
	self.queue_free()
