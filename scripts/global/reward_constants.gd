extends Node

enum RewardPlayer{
#	LASER_UPGRADE,
	ATTACK_UPGRADE,POWER_SPEED_UP,
	STAR_SCORE,
	HEAL,
}

const  reward_group = {
#	RewardPlayer.LASER_UPGRADE: {"tscn":preload("res://scenes/upgrade/laserupgrade.tscn"),"group":null},
	RewardPlayer.ATTACK_UPGRADE:{"tscn":preload("res://scenes/upgrade/attack_interval_upgrade.tscn"),"group":attack_interval_group},
	RewardPlayer.HEAL:{"tscn":preload("res://scenes/upgrade/pill_heal.tscn"), "group":pill_group},
	RewardPlayer.POWER_SPEED_UP:{"tscn":preload("res://scenes/upgrade/laser_speed_up.tscn"), "group":power_up_speed_group},
	RewardPlayer.STAR_SCORE:{"tscn":preload("res://scenes/upgrade/star_score.tscn"), "group":power_up_star_group},
}

enum RewardLevel{
	BLUE,GREEN,YELLOW,RED
}
#回血药丸
const pill_group = {
	RewardLevel.BLUE:{"resource":preload("res://assets/PNG/Power-ups/pill_blue.png"), "heal": 1.0},
	RewardLevel.GREEN:{"resource":preload("res://assets/PNG/Power-ups/pill_green.png"), "heal": 2.0},
	RewardLevel.YELLOW:{"resource":preload("res://assets/PNG/Power-ups/pill_yellow.png"), "heal": 5.0},
	RewardLevel.RED:{"resource":preload("res://assets/PNG/Power-ups/pill_red.png"), "heal": 10.0},
}

# 子弹升级
const power_up_group = {
	RewardLevel.BLUE:{"resource":preload("res://assets/PNG/Power-ups/powerupBlue.png")},
	RewardLevel.GREEN:{"resource":preload("res://assets/PNG/Power-ups/powerupGreen.png")},
	RewardLevel.YELLOW:{"resource":preload("res://assets/PNG/Power-ups/powerupYellow.png")},
	RewardLevel.RED:{"resource":preload("res://assets/PNG/Power-ups/powerupRed.png")},
}

#子弹速度升级
const power_up_speed_group = {
	RewardLevel.BLUE:{"resource":preload("res://assets/PNG/Power-ups/powerupBlue_bolt.png"),"speed_up":1.0},
	RewardLevel.GREEN:{"resource":preload("res://assets/PNG/Power-ups/powerupGreen_bolt.png"),"speed_up":2.0},
	RewardLevel.YELLOW:{"resource":preload("res://assets/PNG/Power-ups/powerupYellow_bolt.png"),"speed_up":5.0},
	RewardLevel.RED:{"resource":preload("res://assets/PNG/Power-ups/powerupRed_bolt.png"),"speed_up":10.0},
}

# TODO:// 盾牌
const power_up_shield_group = {
	RewardLevel.BLUE:{"resource":preload("res://assets/PNG/Power-ups/powerupBlue_shield.png")},
	RewardLevel.GREEN:{"resource":preload("res://assets/PNG/Power-ups/powerupGreen_shield.png")},
	RewardLevel.YELLOW:{"resource":preload("res://assets/PNG/Power-ups/powerupYellow_shield.png")},
	RewardLevel.RED:{"resource":preload("res://assets/PNG/Power-ups/powerupRed_shield.png")},
}

# 积分道具
const power_up_star_group = {
	RewardLevel.BLUE:{"resource":preload("res://assets/PNG/Power-ups/powerupBlue_star.png"),"score":50},
	RewardLevel.GREEN:{"resource":preload("res://assets/PNG/Power-ups/powerupGreen_star.png"),"score":100},
	RewardLevel.YELLOW:{"resource":preload("res://assets/PNG/Power-ups/powerupYellow_star.png"),"score":200},
	RewardLevel.RED:{"resource":preload("res://assets/PNG/Power-ups/powerupRed_star.png"),"score":500},
}

enum RewardBracket{
	BRONZE,GOLD,SILVER
}

# 攻击速度道具
const attack_interval_group ={
	RewardBracket.BRONZE:{"resource":preload("res://assets/PNG/Power-ups/bolt_bronze.png"),"reward_attack_interval":0.1},
	RewardBracket.GOLD:{"resource":preload("res://assets/PNG/Power-ups/bolt_gold.png"),"reward_attack_interval":0.5},
	RewardBracket.SILVER:{"resource":preload("res://assets/PNG/Power-ups/bolt_silver.png"),"reward_attack_interval":1.0},
}

var random_generator = RandomNumberGenerator.new()

func _ready():
	random_generator.randomize()

func random_reward_player():
	var index = random_generator.randi_range(0,RewardPlayer.HEAL)
	var rg = reward_group[index]
	var group: Dictionary =rg["group"]
	var item = rg["tscn"].instantiate()
	var group_index = random_generator.randi_range(0,group.size()-1)
	var params = group[group_index]
	for key in params:
		if key == "resource":
			item.set_shape(params["resource"])
		else:
#			print_debug("before set",item[key])
			item[key] = params[key]
#			print_debug("after set",item[key])
	return item
	
