extends Area2D
class_name Laser

@export var direction: FlyDirectionComponent.FlightDirection
var fly_direction: FlyDirectionComponent
var attack: AttackComponent
var clear_after_deaded: float = 2.0
var deaded = false
var can_reborn = true
var action:String
# Called when the node enters the scene tree for the first time.
func _ready():
	$Timer.wait_time = clear_after_deaded
	$Timer.connect("timeout",Callable(self,"free_self_and_pool"))
	
	var data = LaserConstants.LASER_DICT_BLUE[LaserConstants.play1_current_laser_level]
	$LaserGrphic.set_texture(load(data["path"]))
	self.fly_direction = FlyDirectionComponent.new(LaserConstants.play1_current_speed,direction,0)
	self.add_child(self.fly_direction)
	self.attack = AttackComponent.new(data["attack"])
	self.add_child(self.attack)
	self.action = data["action"]
	$AnimatedSprite2D.play(data["action"])


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
	$AnimatedSprite2D.stop()

func reset():
	self.deaded = false
	self.fly_direction.speed = LaserConstants.play1_current_speed
	self.set_visible(true)
	$Timer.stop()
	$AnimatedSprite2D.play(self.action)

func free_self_and_pool():
	LaserObjectPool.remove_laser(self)
	self.queue_free()

func rotation_angle(angle: float):
	self.fly_direction.radians = deg_to_rad(angle)
	self.set_rotation_degrees(angle)
	var radians = abs(cos(deg_to_rad(angle)))
	self.set_scale(Vector2(radians,radians))
