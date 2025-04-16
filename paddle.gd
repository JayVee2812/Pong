extends CharacterBody2D
signal paddle(pad)

var speed = 3.5
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	var mousePos = get_global_mouse_position()
	var to_mouse = mousePos.y - position.y
	var velocity = Vector2(0,0)
	emit_signal("paddle", position.x)
	
	if to_mouse > 10 || to_mouse < -10 :
		var dir = sign(mousePos.y - position.y)
		velocity = Vector2(0,dir * speed)
		move_and_collide(velocity)
	
	position = position.clamp(Vector2.ZERO + Vector2(0, 40), screen_size - Vector2(0,40))
	
	
	
