extends Node
class_name HealthComponent

@export var MAX_HEALTH: float
var health: float
var deaded: bool = false

func _init(max_health: float):
	self.MAX_HEALTH = max_health

func _ready():
	reset()

func get_damage(atc: AttackComponent,callback: Callable) -> void:
	health -= atc.attack
	if health<=0:
		deaded = true
		callback.call()

func is_alive() -> bool:
	return not self.deaded

func reset():
	health = MAX_HEALTH
	deaded = false

func heal_self(heal_pill: PillHeal):
	self.health += heal_pill.heal
	if self.health > self.MAX_HEALTH:
		self.health = self.MAX_HEALTH
