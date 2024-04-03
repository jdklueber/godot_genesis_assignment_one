extends CharacterBody2D

const JUMP_VELOCITY = -350.0
@onready var jump_sound: AudioStreamPlayer2D = $JumpSound
@onready var death_sound: AudioStreamPlayer2D = $DeathSound
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D
@onready var collision_shape_2d: CollisionShape2D = $CollisionShape2D

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity: int = ProjectSettings.get_setting("physics/2d/default_gravity")

var dying = false

func _physics_process(delta: float) -> void:
	if not is_on_floor():
		velocity.y += gravity * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		jump_sound.play()

	move_and_slide()

func die():
	if not dying:
		dying = true
		animated_sprite_2d.visible = false
		collision_shape_2d.disabled = true
		death_sound.play()


func _on_death_sound_finished() -> void:
	queue_free()
	EventBus.game_over.emit()
