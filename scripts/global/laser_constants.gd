extends Node


var play1_current_laser_level = "blue1"
var play1_current_speed:float
var origin_speed:float = 175

const LASER_DICT_BLUE = {
	"blue1": {"path": "res://assets/PNG/Lasers/laserBlue1_1.png", "attack":1, "action":"fly1", "next_level":"blue2"},
	"blue2": {"path": "res://assets/PNG/Lasers/laslue2_1.png", "attack":2, "action":"fly2",  "next_level":"blue3"},
	"blue3": {"path": "res://assets/PNG/Lasers/laserBlue3_1.png", "attack":4, "action":"fly3",  "next_level":"blue4"},
	"blue4": {"path": "res://assets/PNG/Lasers/laserBlue4_1.png", "attack":10, "action":"fly4",  "next_level":"blue4"},
}

var random_generator = RandomNumberGenerator.new()
enum Item { Up, No, down }
var item_probabilities = {
	Item.Up: 0.1,  # 20% 的概率
	Item.No: 0.899,  # 50% 的概率
	Item.down: 0.001   # 30% 的概率
}

func _ready():
	# 设置随机数生成器的种子，可以使随机数更随机
	random_generator.randomize()
	self.play1_current_speed = self.origin_speed
	# 执行抽检
#	var result = random_get_upgrade()
#	print("抽检结果: ", result)

func random_get_upgrade():
	var random_value = random_generator.randf()

	# 比较随机数与概率，决定抽检结果
	var current_probability = 0.0
	for item in Item.values():
		current_probability += item_probabilities[item]
		if random_value <= current_probability:
			return item
	# 如果没有匹配项，返回一个默认值，或者您可以执行其他操作
	return Item.No

func speed_up(add: float):
	self.play1_current_speed += add

func revert_speed():
	self.play1_current_speed = self.origin_speed
