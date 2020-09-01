extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const MAX_SPEED = 200
const JUMP_HEIGHT = -550
const ACCELERATION = 50

var motion = Vector2()

func _process(delta):
	if position.y > 640:
		get_tree().reload_current_scene()
		
	if Input.is_key_pressed(KEY_ESCAPE):
		get_tree().change_scene("res://Start Menu.tscn")
	
func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	
	
	if Input.is_key_pressed(KEY_D):
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
	elif Input.is_key_pressed(KEY_A):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
	else:
		motion.x = 0
		$Sprite.play("Idle")
		friction = true
	
	if is_on_floor():
		if Input.is_key_pressed(KEY_SPACE):
			motion.y = JUMP_HEIGHT
			$Sprite/JumpSound.play()
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
			
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
	motion = move_and_slide(motion, UP)
	pass


