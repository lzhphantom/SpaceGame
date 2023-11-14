extends Node

var peer = ENetMultiplayerPeer.new()
@onready var meteorsTimer:Timer = $MeteorsSpawner/Timer
@onready var enemyTimer:Timer = $EnemySpawner/Timer
const PLAYER = preload("res://scenes/player/player.tscn")

func add_player(id:int) -> void:
	var player = PLAYER.instantiate()
	player.name = str(id)
	$Players.add_child(player)


func _on_create_button_down():
	var err = peer.create_server(6969)
	if err != OK:
		printerr("创建服务器失败,",err)
		return
	
	multiplayer.multiplayer_peer = peer
	multiplayer.peer_connected.connect(_on_peer_conneted)
	add_player(multiplayer.get_unique_id())
	start()
	$UI.visible = false

func _on_peer_conneted(id: int) -> void:
	add_player(id)

func _on_join_button_down():
	peer.create_client("127.0.0.1",6969)
	multiplayer.multiplayer_peer = peer
	$UI.visible = false


func start():
#	meteorsTimer.start()
	enemyTimer.start()
	pass
