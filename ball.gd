extends CharacterBody2D
signal ballPos(val)
signal pscore(val)
signal escore(val)

var rng1 = RandomNumberGenerator.new()
var rng2 = RandomNumberGenerator.new()
var speed = 6.5
var randx
var randy
var player_score = 0
var evil_score = 0

func _ready() -> void:
	randx = sign(rng1.randf_range(-1,1))
	randy = rng2.randf_range(-0.5,0.5)

func _physics_process(delta: float) -> void:
	move_and_collide(Vector2(randx,randy) * speed)
	emit_signal("ballPos", position.y)

func _on_bounce_area_entered(area) -> void:
	if area.is_in_group("pad"):
		randx = randx * -1
		randy = rng2.randf_range(randy,randy + 0.5)
		print(randy)
	elif area.is_in_group("arena"):
		randy = randy * -1
	elif area.is_in_group("pgoal"):
		queue_free()
		player_score = player_score + 1
		emit_signal("pscore", str(player_score))
	elif area.is_in_group("egoal"):
		queue_free()
		evil_score = evil_score + 1
		emit_signal("escore", str(evil_score))
