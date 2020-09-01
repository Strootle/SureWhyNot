extends KinematicBody2D

func _process(alpha):
	if self.position.x > 0 - self.texture.get_width():
		move_local_x(-1)
