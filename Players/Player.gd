extends KinematicBody2D

var motion = Vector2(0,0)

const speed = 1500
const gravity = 150
const up = Vector2(0,-1)
const jump_speed = 3500
const world_limit = 3000
const jump_multiplier = 1.5

signal animate


func _physics_process(_delta):
	apply_gravity()
	jump()
	move()
	animate()
	move_and_slide(motion, up)


func apply_gravity():
	if position.y > world_limit:
		get_tree().call_group("Gamestate", "end_game")
	elif is_on_floor() and motion.y > 0:
		motion.y = 0
	elif is_on_ceiling():
		motion.y = 1
	else:
		motion.y += gravity


func jump():
	if Input.is_action_pressed("jump") and is_on_floor():
		motion.y -= jump_speed
		$JumpSFX.play()


func move():
	if Input.is_action_pressed("left") and Input.is_action_pressed("right"):
		motion.x = 0
	elif Input.is_action_pressed("left"):
		motion.x = -speed
	elif Input.is_action_pressed("right"):
		motion.x = speed
	else:
		motion.x = 0


func animate():
	emit_signal("animate", motion)


func hurt():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = -jump_speed
	$PainSFX.play()


func boost():
	position.y -= 1
	yield(get_tree(), "idle_frame")
	motion.y = -jump_speed * jump_multiplier
