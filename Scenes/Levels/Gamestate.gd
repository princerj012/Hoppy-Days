extends Node2D

var coins = 0
var lives = 3
const coin_reset = 10


func _ready():
	add_to_group("Gamestate")


func hurt():
	lives -= 1
	$Player.hurt()
	update_gui()
	if lives == 0:
		end_game()


func end_game():
	get_tree().change_scene("res://Hoppy_Days_Assets/Scenes/Levels/GameOver.tscn")


func update_gui():
	get_tree().call_group("GUI", "update_gui", lives, coins)


func add_coins():
	coins += 1
	update_gui()
	var coin_up = (coins % coin_reset) == 0
	if coin_up:
		add_life()


func add_life():
	lives += 1
	update_gui()



func win_game():
	get_tree().change_scene("res://Hoppy_Days_Assets/Scenes/Levels/WinScreen.tscn")
