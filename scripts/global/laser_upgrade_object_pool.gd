extends Node

var laser_upgrade_pool = []
var can_alive_laser = -1

func add_laser_upgrade_pool(laser_upgrade: LaserUpgrade) -> void:
	laser_upgrade_pool.append(laser_upgrade)

func check_laser_upgrade_pool() -> bool:
	if can_alive_laser !=-1:
		return true
	for i in range(laser_upgrade_pool.size()):
		if laser_upgrade_pool[i] != null:
			if laser_upgrade_pool[i] is LaserUpgrade:
				var laser_upgrade = laser_upgrade_pool[i] as LaserUpgrade
				if laser_upgrade.deaded:
					can_alive_laser = i
					return true
	return false

func reborn_laser_upgrade() -> LaserUpgrade:
	var result = laser_upgrade_pool[can_alive_laser]
	can_alive_laser = -1
	return result

func remove_laser_upgrade(laser) -> void:
	var laser_index = laser_upgrade_pool.find(laser)
	if laser_index != -1:
		laser_upgrade_pool.remove_at(laser_index)
