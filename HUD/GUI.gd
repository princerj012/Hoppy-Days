extends CanvasLayer


func _ready():
	$Control/TextureRect/HBoxContainer/LifeCount.text = "3"
	$Control/TextureRect/HBoxContainer/CoinCount.text = "0"


func update_gui(lives, coins):
	$Control/TextureRect/HBoxContainer/LifeCount.text = str(lives)
	$Control/TextureRect/HBoxContainer/CoinCount.text = str(coins)
