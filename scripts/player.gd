extends CharacterBody2D

@export var move_speed: float = 115.0
var facing: Vector2 = Vector2.DOWN

func _physics_process(_delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if direction.length() > 0.0:
		facing = direction.normalized()
	velocity = direction.normalized() * move_speed
	move_and_slide()
	queue_redraw()

func _draw() -> void:
	# Temporary original pixel-style placeholder. Replace with an authored sprite later.
	draw_rect(Rect2(Vector2(-5, -12), Vector2(10, 8)), Color("#263449"))
	draw_rect(Rect2(Vector2(-4, -11), Vector2(8, 6)), Color("#e8b995"))
	draw_rect(Rect2(Vector2(-5, -4), Vector2(10, 9)), Color("#e8e9ed"))
	draw_rect(Rect2(Vector2(-5, 4), Vector2(4, 5)), Color("#263449"))
	draw_rect(Rect2(Vector2(1, 4), Vector2(4, 5)), Color("#263449"))
	draw_rect(Rect2(Vector2(-4, -12), Vector2(8, 2)), Color("#20232c"))
	draw_rect(Rect2(Vector2(-3, -8), Vector2(2, 1)), Color("#20232c"))
	draw_rect(Rect2(Vector2(2, -8), Vector2(2, 1)), Color("#20232c"))
