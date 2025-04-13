extends CharacterBody2D


var target
var speed = 3.5
var ballPos
var targetPos
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _on_ball_ball_pos(val: Variant) -> void:
	ballPos = val
	target = sign(ballPos - position.y)
	targetPos = ballPos - position.y
	var velocity = Vector2(0,0)
	velocity = Vector2(0,target * speed)
	if targetPos > 10 || targetPos < -10 :
		move_and_collide(velocity)
	
	position = position.clamp(Vector2.ZERO + Vector2(0, 40), screen_size - Vector2(0,40))
