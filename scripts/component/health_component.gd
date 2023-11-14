extends Node
class_name HealthComponent

@export var MAX_HEALTH: float
@export var callback: Callable
var health: float
var deaded: bool = false

signal health_depleted

func _init(max_health: float):
	self.MAX_HEALTH = max_health

func _ready():
	self.connect("health_depleted",Callable(self,"_on_health_depleted"))
	reset()

func _process(_delta):
	if health <=0 and not deaded:
		emit_signal("health_depleted")
		

func _on_health_depleted():
	callback.call()
	

func get_damage(atc: AttackComponent) -> void:
	health -= atc.attack
	if health<=0:
		deaded = true
		emit_signal("health_depleted")

func is_alive() -> bool:
	return not self.deaded

func reset():
	health = MAX_HEALTH
	deaded = false

func heal_self(heal_pill: PillHeal):
	self.health += heal_pill.heal
	if self.health > self.MAX_HEALTH:
		self.health = self.MAX_HEALTH

func add_max_health(hp: float):
	self.MAX_HEALTH += hp
	self.health +=hp
