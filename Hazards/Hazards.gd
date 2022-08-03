extends Area2D


func _on_3SpikeTop_body_entered(_body):
	get_tree().call_group("Gamestate", "hurt")


func _on_Spikeman_body_entered(_body):
	get_tree().call_group("Gamestate", "hurt")


func _on_Sun_body_entered(_body):
	get_tree().call_group("Gamestate", "hurt")
