extends Area2D

@export var score:int = 50
@export var speed: float = 120
@export var direction: FlyDirectionComponent.FlightDirection
var fly_direction: FlyDirectionComponent

func _ready():
	self.fly_direction = FlyDirectionComponent.new(speed,direction)
	self.add_child(self.fly_direction)


func _process(delta):
	self.fly_direction.move(delta)


func _on_area_entered(other_area):
	if other_area is Player:
		GameState.increase_score(self.score)
		self.queue_free()

func set_shape(resource: Resource) -> void:
	$Sprite2D.set_texture(resource)
