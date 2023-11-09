extends Area2D
class_name meteors

@export var speed: float = 120
@export var direction: FlyDirectionComponent.FlightDirection
var fly_direction: FlyDirectionComponent

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.fly_direction.move(delta)


func _on_area_entered(other_area):
	if other_area is Player:
		var player = other_area as Player
		player.game_over()
