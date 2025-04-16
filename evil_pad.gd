extends CharacterBody2D


var target
var speed = 3.5
var is_go = speed
var ballPos
var targetPos
var screen_size
var isStopped = false


func _ready() -> void:
	screen_size = get_viewport_rect().size

func _on_spawner_ball_pos(val: Variant) -> void:
	ballPos = val
	target = sign(ballPos - position.y)
	targetPos = ballPos - position.y
	var velocity = Vector2(0,0)
	if isStopped == false:
		velocity = Vector2(0,target * is_go)
		if targetPos > 10|| targetPos < -10:
			move_and_collide(velocity)
	elif isStopped == true:
		velocity = Vector2(0,0)
		if targetPos > 10|| targetPos < -10:
			move_and_collide(velocity)
	position = position.clamp(Vector2.ZERO + Vector2(0, 40), screen_size - Vector2(0,40))

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("ball"):
		$Timer.start()
		isStopped = true

func _on_timer_timeout() -> void:
	isStopped = false
	print("Time")
