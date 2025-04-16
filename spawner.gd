extends Node2D
signal ballPos(val)
signal ballx(x)

var ball = preload("res://ball.tscn")

func _process(delta: float) -> void:
	respawn()
	emit_signal("ballPos", self.get_child(0).global_position.y)
	emit_signal("ballx", self.get_child(0).global_position.x)

func respawn():
	if self.get_child_count() == 0 :
		var ball_instance = ball.instantiate()
		self.add_child(ball_instance)
