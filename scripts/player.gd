extends CharacterBody2D

@export var move_speed: float = 115.0
var facing: Vector2 = Vector2.DOWN

func _physics_process(_delta: float) -> void:
	var direction := Vector2.ZERO

	# Support both WASD and arrow keys without requiring manual Input Map setup.
	direction.x = float(Input.is_key_pressed(KEY_D) or Input.is_key_pressed(KEY_RIGHT)) - float(Input.is_key_pressed(KEY_A) or Input.is_key_pressed(KEY_LEFT))
	direction.y = float(Input.is_key_pressed(KEY_S) or Input.is_key_pressed(KEY_DOWN)) - float(Input.is_key_pressed(KEY_W) or Input.is_key_pressed(KEY_UP))
	direction = direction.normalized()

	if not direction.is_zero_approx():
		facing = direction

	velocity = direction * move_speed
	move_and_slide()
	queue_redraw()

func _draw() -> void:
	# Lightweight placeholder until the production character spritesheet is ready.
	draw_rect(Rect2(Vector2(-6, -11), Vector2(12, 17)), Color("#202b38"))
	draw_rect(Rect2(Vector2(-5, -10), Vector2(10, 7)), Color("#e8b995"))
	draw_rect(Rect2(Vector2(-5, -3), Vector2(10, 9)), Color("#e3d5b9"))
	draw_rect(Rect2(Vector2(-5, 6), Vector2(4, 5)), Color("#263449"))
	draw_rect(Rect2(Vector2(1, 6), Vector2(4, 5)), Color("#263449"))
	draw_rect(Rect2(Vector2(-5, -12), Vector2(10, 3)), Color("#20232c"))
	draw_rect(Rect2(Vector2(-4, -7), Vector2(2, 1)), Color("#20232c"))
	draw_rect(Rect2(Vector2(2, -7), Vector2(2, 1)), Color("#20232c"))
