extends Node2D

@export var block_speed:float = -200


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	global_position.x += block_speed * delta


func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		body.die()
