extends Node2D

var timeout = false


func _process(_delta):
	if $Sprite/RayCast2D.is_colliding():
		fire()


func fire():
	if not timeout:
		$Sprite/RayCast2D.add_child(load("res://Hoppy_Days_Assets/GFX/Enemies/Lightning.tscn").instance())
		$Sprite/Timer.start()
		timeout = true


func _on_Timer_timeout():
	timeout = false
