extends ParallaxBackground

@export var scroll_rate:float = -.5
@onready var parallax_layer: ParallaxLayer = $ParallaxLayer
@onready var texture_rect: TextureRect = $ParallaxLayer/TextureRect

var screen_size:Vector2

func _ready() -> void:
	screen_size = get_viewport().get_visible_rect().size;
	texture_rect.size = screen_size
	parallax_layer.motion_mirroring.x = texture_rect.size.x


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	scroll_offset.x += scroll_rate
