extends Node2D

@export var spawn_rate_min_secs:float = .5
@export var spawn_rate_max_secs:float = 1.5
@export var spawn_scene:PackedScene
@onready var timer: Timer = $Timer

var rng = RandomNumberGenerator.new()

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset_timer()

func reset_timer():
	timer.wait_time = rng.randf_range(spawn_rate_min_secs, spawn_rate_max_secs)

func _on_timer_timeout() -> void:
	var new_obstacle = spawn_scene.instantiate() as Node2D
	add_child(new_obstacle)
	new_obstacle.global_position = global_position
	reset_timer()
