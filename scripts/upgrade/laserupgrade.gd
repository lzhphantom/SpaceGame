extends Area2D
class_name LaserUpgrade

@export var heal:float = 1.0
@export var speed: float = 120
@export var direction: FlyDirectionComponent.FlightDirection
var fly_direction: FlyDirectionComponent


func _ready():
	self.fly_direction = FlyDirectionComponent.new(speed,direction,0)
	self.add_child(self.fly_direction)


func _process(delta):
	self.fly_direction.move(delta)

func _on_area_entered(other_area):
	if other_area is Player:
		var player = other_area as Player
		self.queue_free()
		player.fire_upgrade()

func set_shape(resource: Resource) -> void:
	$Sprite2D.set_texture(resource)
	rpc("set_shape_same",resource)

@rpc("any_peer")
func set_shape_same(resource: Resource) -> void:
	print("调用中")
	$Sprite2D.set_texture(resource)
