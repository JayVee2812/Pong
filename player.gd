extends Label

func _ready() -> void:
	$".".text = "0"

func _process(delta: float) -> void:
	$".".text = str(Points.ppoints)
