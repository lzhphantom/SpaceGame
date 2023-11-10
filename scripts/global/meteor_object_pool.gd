extends Node

const meteors_tscn = [
	preload("res://scenes/meteors/meteor_big_1.tscn"),
	preload("res://scenes/meteors/meteor_big_2.tscn"),
	preload("res://scenes/meteors/meteor_big_3.tscn"),
	preload("res://scenes/meteors/meteor_big_4.tscn"),
	preload("res://scenes/meteors/meteor_med_1.tscn"),
	preload("res://scenes/meteors/meteor_med_2.tscn"),
	preload("res://scenes/meteors/meteor_small_1.tscn"),
	preload("res://scenes/meteors/meteor_small_2.tscn"),
	preload("res://scenes/meteors/meteor_tiny_1.tscn"),
	preload("res://scenes/meteors/meteor_tiny_2.tscn"),
]

var meteors_pool = []
var can_alive_meteors = -1
var random: RandomNumberGenerator = RandomNumberGenerator.new()

func _ready():
	self.random.randomize()

func add_meteors_pool():
	var meteors_index = random.randi_range(0,meteors_tscn.size()-1)
	var item = meteors_tscn[meteors_index].instantiate()
	meteors_pool.append(item)
	return item

func check_meteors_pool() -> bool:
	if can_alive_meteors !=-1:
		return true
	for i in range(meteors_pool.size()):
		if meteors_pool[i] != null:
			if meteors_pool[i] is Meteors:
				var meteors = meteors_pool[i] as Meteors
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
