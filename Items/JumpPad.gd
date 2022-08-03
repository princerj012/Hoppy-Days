extends Area2D


func _ready():
	$AnimatedSprite.play("Default")


func _on_JumpPad_body_entered(body):
	$AnimatedSprite.play("Boost")
	body.boost()
