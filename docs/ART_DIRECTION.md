# Art Direction

## Visual target

Cibiteng uses a polished modern pixel-art presentation: readable silhouettes, controlled palettes, layered environments, expressive lighting, and clean UI. The setting should feel like a contemporary Indonesian/Bekasi-inspired neighborhood rather than a generic fantasy village.

## Environment rules

- Use a consistent 16x16 or 32x32 world tile grid. Final tile size is pending prototype testing.
- Keep outlines subtle and consistent.
- Use warm sunlight, leafy greens, muted concrete, painted shop fronts, and locally recognizable details.
- Prioritize readable roads, sidewalks, fences, drainage channels, utility poles, warungs, clinics, mosques, schools, and neighborhood houses.
- Use parallax sparingly. The target hardware is low-end.
- Avoid excessive particle effects and large translucent overlays.

## Character rules

- Gameplay characters: top-down pixel sprites with clear four-direction silhouettes.
- Dialogue portraits: separate illustrated anime/manhwa-style art, knee-up composition, one outfit per asset.
- Portrait expressions should support dialogue emotion.
- Never bake dialogue text into portraits.

## UI rules

- Dark blue-gray panels with warm off-white text.
- Clear HP, stamina, and energy indicators.
- Large touch targets on Android.
- Avoid clutter and tiny text.
- UI must scale to 16:9 PC and portrait/landscape Android layouts after the first prototype is stable.

## Palette starting point

| Use | Color |
|---|---|
| Deep ink | #202B38 |
| Slate | #394957 |
| Leaf | #4D8755 |
| Grass | #83A975 |
| Warm wall | #E3D5B9 |
| Terracotta | #C97855 |
| Sky glass | #A8D3D5 |
| Warm highlight | #FFE29A |

## Asset production status

The first generated visual is a concept-direction board, not a production-ready sprite sheet. Its individual elements must be recreated/exported as clean, consistently sized assets before being used in the game. The current prototype uses procedural placeholder shapes so the project remains runnable and lightweight.
