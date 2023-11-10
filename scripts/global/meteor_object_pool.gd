extends Node

var meteors_pool = []
var can_alive_meteors = -1

func add_meteors_pool(meteors: Meteors) -> void:
	meteors_pool.append(meteors)

func check_meteors_pool() -> bool:
	if can_alive_meteors !=-1:
		return true
	for i in range(meteors_pool.size()):
		if meteors_pool[i] != null:
			if meteors_pool[i] is Meteors:
				var meteors = meteors_pool[i] as Laser
				if meteors.deaded:
					can_alive_meteors = i
					return true
	return false

func reborn_meteors() -> Meteors:
	if can_alive_meteors >= meteors_pool.size():
		for i in range(meteors_pool.size()):
			if meteors_pool[i] != null:
				if meteors_pool[i] is Meteors:
					var meteors = meteors_pool[i] as Meteors
					if meteors.deaded:
						can_alive_meteors = i
	var result = meteors_pool[can_alive_meteors]
	can_alive_meteors = -1
	return result

func remove_meteors(meteors) -> void:
	var meteors_index = meteors_pool.find(meteors)
	if meteors_index != -1:
		meteors_pool.remove_at(meteors_index)
