extends Node

class_name FlyDirectionComponent

enum FlightDirection { UP, DOWN }

var speed: float
var direction: FlightDirection

func _init(spd: float,direct: FlightDirection):
	self.speed = spd
	self.direction = direct

func move(delta):
	if get_parent():
		match direction:
			FlightDirection.UP:
				get_parent().position.y -= self.speed*delta
			FlightDirection.DOWN:
				get_parent().position.y += self.speed*delta


