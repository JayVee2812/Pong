extends CharacterBody2D
signal ballPos(val)
signal pscore(val)
signal escore(val)
signal ballx(ballx)

var rng1 = RandomNumberGenerator.new()
var rng2 = RandomNumberGenerator.new()
var speed = 6.5
var randx
var randy
var player_score = 0
var evil_score = 0
var dead = false
var bx

func _ready() -> void:
	randx = sign(rng1.randf_range(-1,1))
	randy = rng2.randf_range(-0.5,0.5)
	bx = randx


func _physics_process(delta: float) -> void:
	move_and_collide(Vector2(randx,randy) * speed)
	emit_signal("ballPos", position.y)
	emit_signal("ballx", bx)
func _on_bounce_area_entered(area) -> void:
	if area.is_in_group("pad"):
		randx = randx * -1
		bx= randx
		randy = rng2.randf_range(randy,randy + 0.5)
		
	elif area.is_in_group("arena"):
		randy = randy * -1
		
	elif area.is_in_group("pgoal"):
		Points.ppoints += 1
		emit_signal("pscore", player_score)
		dead = true
		queue_free()
		
	elif area.is_in_group("egoal"):
		Points.epoints += 1
		emit_signal("escore", evil_score)
		dead = true
		queue_free()
		
	elif dead == true:
		get_tree().reload_current_scene()
