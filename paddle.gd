extends CharacterBody2D

var speed = 10
var screen_size

func _ready() -> void:
	screen_size = get_viewport_rect().size

func _physics_process(delta: float) -> void:
	var mousePos = get_global_mouse_position()
	var to_mouse = mousePos.y - position.y
	var velocity = Vector2(0,0)
	
	if to_mouse > 10 || to_mouse < -10 :
		var dir = sign(mousePos.y - position.y)
		velocity = Vector2(0,dir * speed)
		move_and_collide(velocity)
		print(to_mouse)
	
	position = position.clamp(Vector2.ZERO, screen_size)
	
	
	
