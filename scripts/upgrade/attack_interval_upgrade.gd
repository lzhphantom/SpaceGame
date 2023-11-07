extends Area2D
class_name AttackIntervalUpgrade

@export var reward_attack_interval: float = 0.1
@export var speed: float = 120
@export var direction: FlyDirectionComponent.FlightDirection
var fly_direction: FlyDirectionComponent

func _ready():
	self.fly_direction = FlyDirectionComponent.new(speed,direction,0)
	self.add_child(self.fly_direction)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.fly_direction.move(delta)

func _on_area_entered(other_area):
	if other_area is Player:
		var player = other_area as Player
		self.queue_free()
		player.add_attack_interval(reward_attack_interval)

func set_shape(resource: Resource) -> void:
	$Sprite2D.set_texture(resource)
