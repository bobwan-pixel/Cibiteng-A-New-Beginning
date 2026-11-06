# Asset Manifest

This file tracks production deliverables. Status meanings:
- `planned`: required but not produced
- `generated`: output exists but has not passed review
- `reviewed`: checked for technical and visual consistency
- `approved`: accepted for production
- `integrated`: imported and used in the Godot project

| ID | Asset group | Deliverables | Status | Notes |
|---|---|---|---|---|
| ENV-001 | Core terrain | Grass, dirt, path, road, sidewalk, intersections | planned | Establish 16x16 tile grid first |
| ENV-002 | Buildings | House, warung, clinic, school, masjid exteriors | planned | Modular walls, roofs, doors, windows |
| ENV-003 | Nature | Trees, bushes, flowers, crops | planned | Multiple silhouettes and growth states |
| ENV-004 | Street props | Poles, lamps, signs, benches, drains, bins | planned | Match Indonesian setting |
| ENV-005 | Interiors | Home, warung, clinic, school, public interiors | planned | Separate interior tilesets |
| CHAR-001 | Bobwan | Four directions, idle, walk | planned | Main character sprite sheet |
| CHAR-002 | NPC sprites | All approved NPCs | planned | Small reviewed batches; no copy-paste faces |
| POR-001 | NPC portraits | One portrait per approved NPC | planned | Anime/manhwa knee-up, distinct designs |
| ITEM-001 | Daily items | Food, ingredients, household goods | planned | Transparent icon sheets |
| ITEM-002 | Quest/evidence | Story objects and evidence | planned | Must match story continuity |
| ITEM-003 | Equipment | Clothing, tools, combat equipment | planned | Consistent icon scale |
| UI-001 | HUD | Status bars, clock, money, prompts | planned | PC and Android layouts |
| UI-002 | Menus | Inventory, status, quests, map, settings | planned | Shared visual system |
| UI-003 | Dialogue | Dialogue box, nameplate, choices | planned | Portrait-compatible |
| UI-004 | Combat UI | HP, stamina, energy, skills, feedback | planned | Touch-friendly controls |
| FX-001 | Combat effects | Hit, block, dash, skill, knockout | planned | Readable at game resolution |
| AUD-001 | Sound | Ambience, UI, combat, music | planned | Track source/license |
| PACK-001 | Export metadata | Atlases, pivots, frame timing, import notes | planned | Required before engine integration |

## Current verified state
- The visual showcase is a concept board, not a set of separated production files.
- Five NPCs in the current Godot prototype are temporary procedural placeholders.
- No listed production group is approved or integrated yet.
