extends Area2D
class_name PillHeal

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
		player.health_component.heal_self(self)
		self.queue_free()

func set_shape(resource: Resource) -> void:
	$Sprite2D.set_texture(resource)
