extends Label

func _ready() -> void:
	$".".text = "0"

func _on_ball_escore(val: Variant) -> void:
	$".".text = val
