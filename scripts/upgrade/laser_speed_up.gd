extends Area2D
class_name  LaserSpeedUp


@export var speed_up:float = 1

@export var heal:float = 1.0
@export var speed: float = 120
@export var direction: FlyDirectionComponent.FlightDirection
var fly_direction: FlyDirectionComponent

func _ready():
	self.fly_direction = FlyDirectionComponent.new(speed,direction,0)
	self.add_child(self.fly_direction)


func _process(delta):
	self.fly_direction.move(delta)

func set_shape(resource: Resource) -> void:
	$Sprite2D.set_texture(resource)


func _on_area_entered(other_area):
	if other_area is Player:
		LaserConstants.speed_up(self.speed_up)
		self.queue_free()
