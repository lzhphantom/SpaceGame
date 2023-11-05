extends Node

var laser_pool = []
var can_alive_laser = -1

func add_laser_pool(laser:Laser) -> void:
	laser_pool.append(laser)

func check_laser_pool() -> bool:
	if can_alive_laser !=-1:
		return true
	for i in range(laser_pool.size()):
		if laser_pool[i] != null:
			if laser_pool[i] is Laser:
				var laser = laser_pool[i] as Laser
				if laser.deaded and laser.can_reborn:
					can_alive_laser = i
					return true
	return false

func reborn_laser() -> Laser:
	if can_alive_laser>=laser_pool.size():
		for i in range(laser_pool.size()):
			if laser_pool[i] != null:
				if laser_pool[i] is Laser:
					var laser = laser_pool[i] as Laser
					if laser.deaded and laser.can_reborn:
						can_alive_laser = i
	var result = laser_pool[can_alive_laser]
	can_alive_laser = -1
	return result

func remove_laser(laser) -> void:
	var laser_index = laser_pool.find(laser)
	if laser_index != -1:
		laser_pool.remove_at(laser_index)

func upgrade_laser() -> void:
	for item in laser_pool:
		if item != null:
			if item is Laser:
				var laser = item as Laser
				laser.can_reborn = false
