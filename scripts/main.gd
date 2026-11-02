extends Node2D

const MAP_SIZE := Vector2(1280, 720)
const NPC_POSITION := Vector2(470, 310)

var prompt_label: Label
var dialogue_panel: PanelContainer
var dialogue_label: Label
var player: CharacterBody2D

func _ready() -> void:
	player = get_node("Player")
	_build_hud()
	queue_redraw()

func _process(_delta: float) -> void:
	var near_npc := player.global_position.distance_to(NPC_POSITION) < 54.0
	prompt_label.visible = near_npc and not dialogue_panel.visible
	if near_npc and Input.is_action_just_pressed("ui_accept"):
		dialogue_panel.visible = not dialogue_panel.visible
		dialogue_label.text = "Warga: Pagi! Kamu orang baru di Cibiteng, ya?"
	elif Input.is_action_just_pressed("ui_cancel"):
		dialogue_panel.visible = false

func _build_hud() -> void:
	var layer := CanvasLayer.new()
	add_child(layer)

	var title := Label.new()
	title.text = "CIBITENG  /  DESA CIPTA KASIH"
	title.position = Vector2(18, 14)
	title.add_theme_font_size_override("font_size", 16)
	title.add_theme_color_override("font_color", Color("#f4f0df"))
	layer.add_child(title)

	prompt_label = Label.new()
	prompt_label.text = "[ E / ENTER ]  Bicara"
	prompt_label.position = Vector2(18, 620)
	prompt_label.add_theme_font_size_override("font_size", 18)
	prompt_label.add_theme_color_override("font_color", Color("#ffe29a"))
	layer.add_child(prompt_label)

	dialogue_panel = PanelContainer.new()
	dialogue_panel.position = Vector2(170, 535)
	dialogue_panel.size = Vector2(940, 130)
	dialogue_panel.visible = false
	layer.add_child(dialogue_panel)

	dialogue_label = Label.new()
	dialogue_label.text = ""
	dialogue_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	dialogue_label.add_theme_font_size_override("font_size", 20)
	dialogue_panel.add_child(dialogue_label)

func _draw() -> void:
	# Temporary map illustration built from simple shapes to keep the prototype light.
	draw_rect(Rect2(Vector2.ZERO, MAP_SIZE), Color("#739b68"))
	# Grass variation
	for x in range(0, 1280, 64):
		for y in range(0, 720, 64):
			if (x / 64 + y / 64) % 3 == 0:
				draw_rect(Rect2(Vector2(x + 8, y + 12), Vector2(18, 5)), Color("#83a975"))
	# Main asphalt road
	draw_rect(Rect2(Vector2(0, 410), Vector2(1280, 112)), Color("#515b62"))
	draw_rect(Rect2(Vector2(0, 462), Vector2(1280, 4)), Color("#d7c99c"))
	for x in range(24, 1280, 76):
		draw_rect(Rect2(Vector2(x, 458), Vector2(34, 5)), Color("#f1e6bf"))
	# Side lane
	draw_rect(Rect2(Vector2(700, 0), Vector2(78, 720)), Color("#626a6d"))
	draw_rect(Rect2(Vector2(737, 0), Vector2(3, 720)), Color("#d7c99c"))
	# Houses and shop fronts
	_draw_house(Vector2(100, 120), Color("#c97855"), "WARUNG")
	_draw_house(Vector2(360, 90), Color("#6385a2"), "RUMAH")
	_draw_house(Vector2(850, 115), Color("#b98b57"), "TOKO")
	_draw_house(Vector2(1030, 570), Color("#8d6b9d"), "KLINIK")
	# Trees
	for tree_pos in [Vector2(80, 330), Vector2(300, 330), Vector2(620, 230), Vector2(920, 330), Vector2(1160, 300)]:
		draw_rect(Rect2(tree_pos + Vector2(-5, 12), Vector2(10, 25)), Color("#70513b"))
		draw_circle(tree_pos, 23, Color("#376d4a"))
		draw_circle(tree_pos + Vector2(-7, -5), 13, Color("#4d8755"))
	# NPC
	draw_circle(NPC_POSITION + Vector2(0, 13), 9, Color("#39404a"))
	draw_rect(Rect2(NPC_POSITION + Vector2(-6, -8), Vector2(12, 19)), Color("#f0d7b6"))
	draw_rect(Rect2(NPC_POSITION + Vector2(-7, -13), Vector2(14, 7)), Color("#292d38"))
	draw_circle(NPC_POSITION + Vector2(0, -5), 6, Color("#d8a982"))

func _draw_house(pos: Vector2, roof_color: Color, sign_text: String) -> void:
	draw_rect(Rect2(pos + Vector2(8, 30), Vector2(150, 88)), Color("#e3d5b9"))
	draw_colored_polygon(PackedVector2Array([
		pos + Vector2(0, 34), pos + Vector2(82, 0),
		pos + Vector2(166, 34), pos + Vector2(158, 45),
		pos + Vector2(8, 45)
	]), roof_color)
	draw_rect(Rect2(pos + Vector2(67, 72), Vector2(30, 46)), Color("#765642"))
	draw_rect(Rect2(pos + Vector2(18, 55), Vector2(28, 25)), Color("#a8d3d5"))
	draw_rect(Rect2(pos + Vector2(120, 55), Vector2(24, 25)), Color("#a8d3d5"))
	draw_rect(Rect2(pos + Vector2(18, 8), Vector2(125, 18)), Color("#f3e8d0"))
	draw_string(ThemeDB.fallback_font, pos + Vector2(34, 23), sign_text, HORIZONTAL_ALIGNMENT_LEFT, -1, 11, Color("#35404a"))
