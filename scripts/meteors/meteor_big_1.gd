extends Area2D
class_name Meteors

@export var speed: float = 120
@export var direction: FlyDirectionComponent.FlightDirection
var fly_direction: FlyDirectionComponent
var clear_after_deaded: float = 2.0
var deaded: bool

# Called when the node enters the scene tree for the first time.
func _ready():
	self.fly_direction = FlyDirectionComponent.new(speed,direction,0)
	self.add_child(self.fly_direction)
	
	self.deaded = false
	$Timer.wait_time = clear_after_deaded
	$Timer.connect("timeout",Callable(self,"free_self_and_pool"))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if not self.deaded:
		self.fly_direction.move(delta)
	if self.position.y > get_viewport_rect().size.y:
		self.disable()


func _on_area_entered(other_area):
	if other_area is Player:
		var player = other_area as Player
		if not self.deaded:
			player.game_over()

func disable():
	self.deaded = true
	self.set_visible(false)
	$Timer.start()

func reset():
	self.deaded = false
	self.set_visible(true)
	$Timer.stop()

	
func free_self_and_pool():
	MeteorObjectPool.remove_meteors(self)
	self.queue_free()
