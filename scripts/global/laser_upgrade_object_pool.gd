extends Node

var laser_upgrade_pool = []
var can_alive_laser = -1

func add_laser_upgrade_pool(laser_upgrade):
	laser_upgrade_pool.append(laser_upgrade)

func check_laser_upgrade_pool():
	if can_alive_laser !=-1:
		return true
	for i in range(laser_upgrade_pool.size()):
		if laser_upgrade_pool[i] != null and laser_upgrade_pool[i].deaded:
			pass

func reborn_laser_upgrade():
	var result = laser_upgrade_pool[can_alive_laser]
	can_alive_laser = -1
	return result

func remove_laser_upgrade(laser):
	var laser_index = laser_upgrade_pool.find(laser)
	if laser_index != -1:
		laser_upgrade_pool.remove_at(laser_index)
