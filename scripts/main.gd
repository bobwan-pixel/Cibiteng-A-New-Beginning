extends Node2D

const MAP_SIZE := Vector2(1280, 720)
const INTERACTION_DISTANCE := 58.0

# Temporary NPC designs. Each character has a distinct silhouette and palette.
const NPCS := [
	{
		"name": "Pak RT", "position": Vector2(470, 260),
		"skin": "#bd8968", "hair": "#292d38", "outfit": "#42627b",
		"style": "short", "glasses": true,
		"dialogue": "Pagi! Kamu orang baru di Cibiteng, ya? Kalau butuh bantuan soal lingkungan sini, mampir saja ke balai desa."
	},
	{
		"name": "Mira", "position": Vector2(555, 300),
		"skin": "#e8b995", "hair": "#6b3d2e", "outfit": "#c9788c",
		"style": "long", "glasses": false,
		"dialogue": "Hai! Aku Mira. Kalau mau cari jajanan enak, coba warung di dekat pertigaan."
	},
	{
		"name": "Deni", "position": Vector2(260, 300),
		"skin": "#a9785b", "hair": "#171b24", "outfit": "#d0a64e",
		"style": "spiky", "glasses": false,
		"dialogue": "Lagi santai? Sore biasanya anak-anak kumpul di lapangan."
	},
	{
		"name": "Bu Rina", "position": Vector2(900, 300),
		"skin": "#d7a17f", "hair": "#30252b", "outfit": "#668b78",
		"style": "bob", "glasses": true,
		"dialogue": "Jangan lupa jaga kesehatan. Klinik buka sampai sore hari."
	},
	{
		"name": "Fajar", "position": Vector2(1020, 500),
		"skin": "#c58e6d", "hair": "#b87936", "outfit": "#6474a5",
		"style": "curly", "glasses": false,
		"dialogue": "Bro, kalau mau olahraga, lapangan ada di sebelah timur desa."
	}
]

var prompt_label: Label
var dialogue_panel: PanelContainer
var dialogue_label: Label
var player: CharacterBody2D

func _ready() -> void:
	player = get_node("Player")
	_build_hud()
	queue_redraw()

func _process(_delta: float) -> void:
	var npc := _get_nearest_npc()
	prompt_label.visible = not npc.is_empty() and not dialogue_panel.visible
	if not npc.is_empty():
		prompt_label.text = "[ E ]  BICARA DENGAN " + str(npc["name"]).to_upper()

	if Input.is_action_just_pressed("ui_cancel"):
		dialogue_panel.visible = false

func _unhandled_input(event: InputEvent) -> void:
	if not event is InputEventKey:
		return
	if not event.pressed or event.echo:
		return

	var key := event as InputEventKey
	var interact_pressed := key.keycode == KEY_E or key.keycode == KEY_ENTER or key.keycode == KEY_KP_ENTER or key.keycode == KEY_SPACE
	if not interact_pressed:
		return

	var npc := _get_nearest_npc()
	if not npc.is_empty():
		dialogue_panel.visible = not dialogue_panel.visible
		if dialogue_panel.visible:
			dialogue_label.text = str(npc["name"]).to_upper() + "\n" + str(npc["dialogue"])

func _get_nearest_npc() -> Dictionary:
	var nearest: Dictionary = {}
	var nearest_distance := INTERACTION_DISTANCE
	for npc in NPCS:
		var distance: float = player.global_position.distance_to(npc["position"])
		if distance < nearest_distance:
			nearest_distance = distance
			nearest = npc
	return nearest

func _build_hud() -> void:
	var layer := CanvasLayer.new()
	add_child(layer)

	var title := Label.new()
	title.text = "CIBITENG  /  DESA CIPTA KASIH"
	title.position = Vector2(14, 10)
	title.add_theme_font_size_override("font_size", 12)
	title.add_theme_color_override("font_color", Color("#f4f0df"))
	layer.add_child(title)

	var controls := Label.new()
	controls.text = "WASD / ARROW: GERAK     E / ENTER: BICARA     ESC: TUTUP"
	controls.position = Vector2(14, 336)
	controls.add_theme_font_size_override("font_size", 9)
	controls.add_theme_color_override("font_color", Color("#f4f0df"))
	layer.add_child(controls)

	prompt_label = Label.new()
	prompt_label.text = "[ E ]  BICARA"
	prompt_label.position = Vector2(14, 308)
	prompt_label.add_theme_font_size_override("font_size", 11)
	prompt_label.add_theme_color_override("font_color", Color("#ffe29a"))
	layer.add_child(prompt_label)

	dialogue_panel = PanelContainer.new()
	dialogue_panel.position = Vector2(14, 238)
	dialogue_panel.size = Vector2(612, 88)
	dialogue_panel.visible = false
	layer.add_child(dialogue_panel)

	dialogue_label = Label.new()
	dialogue_label.text = ""
	dialogue_label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
	dialogue_label.add_theme_font_size_override("font_size", 11)
	dialogue_label.add_theme_color_override("font_color", Color("#f4f0df"))
	dialogue_panel.add_child(dialogue_label)

func _draw() -> void:
	# Temporary procedural map. Production tiles will replace these shapes.
	draw_rect(Rect2(Vector2.ZERO, MAP_SIZE), Color("#739b68"))

	for x in range(0, 1280, 32):
		for y in range(0, 720, 32):
			if ((x / 32) + (y / 32)) % 4 == 0:
				draw_rect(Rect2(Vector2(x + 7, y + 9), Vector2(5, 2)), Color("#83a975"))

	# Main road and markings.
	draw_rect(Rect2(Vector2(0, 410), Vector2(1280, 112)), Color("#515b62"))
	draw_rect(Rect2(Vector2(0, 462), Vector2(1280, 3)), Color("#d7c99c"))
	for x in range(24, 1280, 76):
		draw_rect(Rect2(Vector2(x, 458), Vector2(34, 5)), Color("#f1e6bf"))

	# Connecting village lane.
	draw_rect(Rect2(Vector2(700, 0), Vector2(78, 720)), Color("#626a6d"))
	draw_rect(Rect2(Vector2(737, 0), Vector2(3, 720)), Color("#d7c99c"))

	_draw_house(Vector2(100, 120), Color("#c97855"), "WARUNG")
	_draw_house(Vector2(360, 90), Color("#6385a2"), "RUMAH")
	_draw_house(Vector2(850, 115), Color("#b98b57"), "TOKO")
	_draw_house(Vector2(1030, 570), Color("#8d6b9d"), "KLINIK")

	for tree_pos in [Vector2(80, 330), Vector2(300, 330), Vector2(620, 230), Vector2(920, 330), Vector2(1160, 300)]:
		draw_rect(Rect2(tree_pos + Vector2(-4, 12), Vector2(8, 18)), Color("#70513b"))
		draw_rect(Rect2(tree_pos + Vector2(-15, -9), Vector2(30, 25)), Color("#376d4a"))
		draw_rect(Rect2(tree_pos + Vector2(-9, -15), Vector2(18, 12)), Color("#4d8755"))

	for npc in NPCS:
		_draw_npc(npc)

func _draw_npc(npc: Dictionary) -> void:
	var pos: Vector2 = npc["position"]
	var skin := Color(npc["skin"])
	var hair := Color(npc["hair"])
	var outfit := Color(npc["outfit"])
	var outline := Color("#26313a")
	var highlight := outfit.lightened(0.18)

	# Ground shadow and a larger 16-bit-style body silhouette.
	draw_rect(Rect2(pos + Vector2(-9, 17), Vector2(18, 4)), Color("#40513e"))
	draw_rect(Rect2(pos + Vector2(-7, 1), Vector2(14, 16)), outline)
	draw_rect(Rect2(pos + Vector2(-6, 2), Vector2(12, 13)), outfit)
	draw_rect(Rect2(pos + Vector2(-5, 3), Vector2(3, 7)), highlight)
	draw_rect(Rect2(pos + Vector2(2, 3), Vector2(3, 7)), outfit.darkened(0.18))
	draw_rect(Rect2(pos + Vector2(-5, 15), Vector2(4, 6)), outline)
	draw_rect(Rect2(pos + Vector2(1, 15), Vector2(4, 6)), outline)
	draw_rect(Rect2(pos + Vector2(-6, 20), Vector2(6, 2)), Color("#4b403b"))
	draw_rect(Rect2(pos + Vector2(0, 20), Vector2(6, 2)), Color("#4b403b"))

	# Face, ears and hair base.
	draw_rect(Rect2(pos + Vector2(-7, -12), Vector2(14, 14)), outline)
	draw_rect(Rect2(pos + Vector2(-6, -11), Vector2(12, 12)), skin)
	draw_rect(Rect2(pos + Vector2(-8, -7), Vector2(2, 4)), skin)
	draw_rect(Rect2(pos + Vector2(6, -7), Vector2(2, 4)), skin)
	draw_rect(Rect2(pos + Vector2(-7, -14), Vector2(14, 5)), hair)

	# Hair silhouette: each style has a different outline, not just a different color.
	match str(npc["style"]):
		"long":
			draw_rect(Rect2(pos + Vector2(-8, -9), Vector2(3, 21)), hair)
			draw_rect(Rect2(pos + Vector2(5, -9), Vector2(3, 21)), hair)
			draw_rect(Rect2(pos + Vector2(-7, -16), Vector2(14, 4)), hair)
			draw_rect(Rect2(pos + Vector2(5, -13), Vector2(3, 3)), hair.lightened(0.12))
		"spiky":
			draw_colored_polygon(PackedVector2Array([
				pos + Vector2(-8, -10), pos + Vector2(-10, -18),
				pos + Vector2(-4, -15), pos + Vector2(-1, -22),
				pos + Vector2(3, -15), pos + Vector2(9, -19),
				pos + Vector2(8, -8)
			]), hair)
		"bob":
			draw_rect(Rect2(pos + Vector2(-8, -9), Vector2(3, 17)), hair)
			draw_rect(Rect2(pos + Vector2(5, -9), Vector2(3, 17)), hair)
			draw_rect(Rect2(pos + Vector2(-7, -16), Vector2(14, 4)), hair)
		"curly":
			for curl in [Vector2(-7, -14), Vector2(-2, -18), Vector2(3, -17), Vector2(7, -13), Vector2(-8, -8), Vector2(8, -8)]:
				draw_rect(Rect2(pos + curl, Vector2(5, 5)), hair)
		_:
			draw_rect(Rect2(pos + Vector2(-7, -15), Vector2(14, 4)), hair)
			draw_rect(Rect2(pos + Vector2(-7, -9), Vector2(3, 5)), hair)

	# Eyes and optional glasses.
	draw_rect(Rect2(pos + Vector2(-4, -5), Vector2(2, 2)), outline)
	draw_rect(Rect2(pos + Vector2(2, -5), Vector2(2, 2)), outline)
	if bool(npc["glasses"]):
		var frame := Color("#202832")
		draw_rect(Rect2(pos + Vector2(-6, -7), Vector2(6, 5)), frame)
		draw_rect(Rect2(pos + Vector2(1, -7), Vector2(6, 5)), frame)
		draw_rect(Rect2(pos + Vector2(-1, -5), Vector2(2, 1)), frame)
		draw_rect(Rect2(pos + Vector2(-5, -6), Vector2(3, 1)), Color("#a8d3d5"))

	# Character name tag makes NPCs easier to identify in the crowded village.
	var name_text := str(npc["name"])
	var text_width := ThemeDB.fallback_font.get_string_size(name_text, HORIZONTAL_ALIGNMENT_LEFT, -1, 8).x
	draw_rect(Rect2(pos + Vector2(-text_width / 2.0 - 4, -31), Vector2(text_width + 8, 11)), Color("#202b38"))
	draw_string(ThemeDB.fallback_font, pos + Vector2(-text_width / 2.0, -23), name_text, HORIZONTAL_ALIGNMENT_LEFT, -1, 8, Color("#f4f0df"))

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
