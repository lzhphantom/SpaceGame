extends Node


var play1_current_laser_level = "blue1"
var play1_current_speed:float
var origin_speed:float = 175

const LASER_DICT_BLUE = {
	"blue1": {"path": "res://assets/PNG/Lasers/laserBlue01.png", "attack":1, "clear_after_deaded":2.0, "next_level":"blue2"},
	"blue2": {"path": "res://assets/PNG/Lasers/laserBlue02.png", "attack":2, "clear_after_deaded":2.0, "next_level":"blue3"},
	"blue3": {"path": "res://assets/PNG/Lasers/laserBlue03.png", "attack":3, "clear_after_deaded":2.0, "next_level":"blue4"},
	"blue4": {"path": "res://assets/PNG/Lasers/laserBlue04.png", "attack":4, "clear_after_deaded":2.0, "next_level":"blue5"},
	"blue5": {"path": "res://assets/PNG/Lasers/laserBlue05.png", "attack":5, "clear_after_deaded":2.0, "next_level":"blue6"},
	"blue6": {"path": "res://assets/PNG/Lasers/laserBlue06.png", "attack":6, "clear_after_deaded":2.0, "next_level":"blue7"},
	"blue7": {"path": "res://assets/PNG/Lasers/laserBlue07.png", "attack":7, "clear_after_deaded":2.0, "next_level":"blue8"},
	"blue8": {"path": "res://assets/PNG/Lasers/laserBlue08.png", "attack":8, "clear_after_deaded":2.0, "next_level":"blue9"},
	"blue9": {"path": "res://assets/PNG/Lasers/laserBlue09.png", "attack":9, "clear_after_deaded":2.0, "next_level":"blue10"},
	"blue10": {"path": "res://assets/PNG/Lasers/laserBlue10.png", "attack":10, "clear_after_deaded":2.0, "next_level":"blue11"},
	"blue11": {"path": "res://assets/PNG/Lasers/laserBlue11.png", "attack":12, "clear_after_deaded":2.0, "next_level":"blue12"},
	"blue12": {"path": "res://assets/PNG/Lasers/laserBlue12.png", "attack":14, "clear_after_deaded":2.0, "next_level":"blue13"},
	"blue13": {"path": "res://assets/PNG/Lasers/laserBlue13.png", "attack":16, "clear_after_deaded":2.0, "next_level":"blue14"},
	"blue14": {"path": "res://assets/PNG/Lasers/laserBlue14.png", "attack":18, "clear_after_deaded":2.0, "next_level":"blue15"},
	"blue15": {"path": "res://assets/PNG/Lasers/laserBlue15.png", "attack":20, "clear_after_deaded":2.0, "next_level":"blue16"},
	"blue16": {"path": "res://assets/PNG/Lasers/laserBlue16.png", "attack":50, "clear_after_deaded":2.0, "next_level":"blue16"},
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
