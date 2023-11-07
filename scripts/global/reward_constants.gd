extends Node

enum RewardPlayer{
	LASER_UPGRADE,ATTACK_UPGRADE,SHIELD,HEAL
}

const  reward_group = {
	RewardPlayer.LASER_UPGRADE: preload("res://scenes/upgrade/laserupgrade.tscn"),
	RewardPlayer.ATTACK_UPGRADE: preload("res://scenes/upgrade/attack_interval_upgrade.tscn")
}

enum RewardLevel{
	BLUE,GREEN,YELLOW,RED
}
const pill_group = {
	RewardLevel.BLUE:{"path":preload("res://assets/PNG/Power-ups/pill_blue.png"), "heal": 1.0},
	RewardLevel.GREEN:{"path":preload("res://assets/PNG/Power-ups/pill_green.png"), "heal": 2.0},
	RewardLevel.YELLOW:{"path":preload("res://assets/PNG/Power-ups/pill_yellow.png"), "heal": 5.0},
	RewardLevel.RED:{"path":preload("res://assets/PNG/Power-ups/pill_red.png"), "heal": 10.0},
}

const power_up_group = {
	RewardLevel.BLUE:{"path":preload("res://assets/PNG/Power-ups/powerupBlue.png")},
	RewardLevel.GREEN:{"path":preload("res://assets/PNG/Power-ups/powerupGreen.png")},
	RewardLevel.YELLOW:{"path":preload("res://assets/PNG/Power-ups/powerupYellow.png")},
	RewardLevel.RED:{"path":preload("res://assets/PNG/Power-ups/powerupRed.png")},
}

const power_up_bolt_group = {
	RewardLevel.BLUE:{"path":preload("res://assets/PNG/Power-ups/powerupBlue_bolt.png")},
	RewardLevel.GREEN:{"path":preload("res://assets/PNG/Power-ups/powerupGreen_bolt.png")},
	RewardLevel.YELLOW:{"path":preload("res://assets/PNG/Power-ups/powerupYellow_bolt.png")},
	RewardLevel.RED:{"path":preload("res://assets/PNG/Power-ups/powerupRed_bolt.png")},
}

const power_up_shield_group = {
	RewardLevel.BLUE:{"path":preload("res://assets/PNG/Power-ups/powerupBlue_shield.png")},
	RewardLevel.GREEN:{"path":preload("res://assets/PNG/Power-ups/powerupGreen_shield.png")},
	RewardLevel.YELLOW:{"path":preload("res://assets/PNG/Power-ups/powerupYellow_shield.png")},
	RewardLevel.RED:{"path":preload("res://assets/PNG/Power-ups/powerupRed_shield.png")},
}

const power_up_star_group = {
	RewardLevel.BLUE:{"path":preload("res://assets/PNG/Power-ups/powerupBlue_star.png")},
	RewardLevel.GREEN:{"path":preload("res://assets/PNG/Power-ups/powerupGreen_star.png")},
	RewardLevel.YELLOW:{"path":preload("res://assets/PNG/Power-ups/powerupYellow_star.png")},
	RewardLevel.RED:{"path":preload("res://assets/PNG/Power-ups/powerupRed_star.png")},
}

enum RewardBracket{
	BRONZE,GOLD,SILVER
}

var random_generator = RandomNumberGenerator.new()

func _ready():
	random_generator.randomize()

