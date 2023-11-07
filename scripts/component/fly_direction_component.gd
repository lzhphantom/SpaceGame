extends Node

class_name FlyDirectionComponent

enum FlightDirection { UP, DOWN }

var speed: float
var direction: FlightDirection
var radians 

func _init(spd: float,direct: FlightDirection,angle:float):
	self.speed = spd
	self.direction = direct
	self.radians = deg_to_rad(angle)

func move(delta):
	if get_parent():
		match direction:
			FlightDirection.UP:
				get_parent().position.y -= self.speed*delta
				get_parent().position.x += self.speed*delta*tan(self.radians)
			FlightDirection.DOWN:
				get_parent().position.y += self.speed*delta
				if self.radians >0:
					get_parent().position.x -= self.speed*delta*tan(self.radians)
				else:
					get_parent().position.x += self.speed*delta*tan(self.radians)


