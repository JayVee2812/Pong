extends Label

func _ready() -> void:
	$".".text = "0"

func _on_ball_pscore(val: Variant) -> void:
	$".".text = val
