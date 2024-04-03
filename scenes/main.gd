extends Node2D

@export var game_scene:PackedScene
@export var title_scene:PackedScene

var current_scene:Node
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	EventBus.game_start.connect(start_game)
	EventBus.game_over.connect(game_over)
	EventBus.quit.connect(quit)
		
	set_current_scene(title_scene)
		
func set_current_scene(new_scene:PackedScene):
	if current_scene != null:
		current_scene.queue_free()
		
	current_scene = new_scene.instantiate()
	add_child(current_scene)

func start_game():
	set_current_scene(game_scene)
	
func game_over():
	set_current_scene(title_scene)

func quit():
	get_tree().quit()
