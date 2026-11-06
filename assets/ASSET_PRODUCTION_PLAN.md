# Asset Production Plan

## Production rule
Finish and approve the complete asset library before building the gameplay engine and story flow. The current generated showcase is a visual direction board only. It is not a production-ready tilesheet, sprite atlas, UI export, or imported Godot asset.

## Locked visual direction
- Game: Cibiteng: A New Beginning
- Studio: KOVEL STUDIO
- Genre: grounded 2D life-sim RPG with romance and fighting
- World: Indonesian village, town, and Bekasi-inspired urban areas; no supernatural elements
- Gameplay art: readable top-down pixel art
- Dialogue portraits: anime/manhwa style, one character per image, knee-up framing, distinct face and silhouette
- Target: PC and Android; keep texture sizes and UI readable on low-end hardware
- Budget: Rp0; use original generated/drawn assets and properly licensed free tools

## Asset completion order

### A. Environment
- [ ] Core 16x16 tile grammar and palette
- [ ] Grass, dirt, paths, roads, sidewalks, intersections, drains
- [ ] House walls, roofs, doors, windows, porches, fences
- [ ] Warung, clinic, school, masjid, public facilities
- [ ] Trees, shrubs, flowers, utility poles, streetlights, signs
- [ ] Interior tiles: home, warung, clinic, school, public buildings
- [ ] Props and seasonal/time-of-day variants where needed
- [ ] Tile atlas metadata and collision/terrain notes

### B. Characters
- [ ] Bobwan: four directions, idle and walk cycles
- [ ] All approved NPCs: unique silhouettes, hair, outfits, accessories
- [ ] NPC sprite sheets grouped into small batches for quality control
- [ ] Portraits: one separate portrait per NPC, distinct face and pose
- [ ] Outfit variants only where the story or event needs them
- [ ] Combat portraits, expressions, hit/guard/attack poses

### C. Items and equipment
- [ ] Food, ingredients, daily goods
- [ ] Quest objects and evidence
- [ ] Tools, weapons, gym/training items
- [ ] Clothing and equipment icons
- [ ] Currency, collectibles, gifts, consumables

### D. User interface
- [ ] Dialogue box and speaker/nameplate
- [ ] HUD: HP, stamina, energy, time/date, money
- [ ] Inventory, equipment, character status
- [ ] Quest log, relationship panel, map, settings
- [ ] Combat controls and feedback
- [ ] Mobile touch controls and safe-area layouts
- [ ] Icon set and UI states (normal, hover/focus, pressed, disabled)

### E. Effects and audio
- [ ] Combat impact, hit, block, dash, skill effects
- [ ] Ambient village/city sound set
- [ ] UI feedback sounds
- [ ] Music themes and location ambience
- [ ] All audio sources and licenses documented

### F. Packaging and approval
- [ ] Consistent naming and folder structure
- [ ] Sprite dimensions, pivots, frame timing, and atlas metadata
- [ ] Transparent backgrounds where required
- [ ] No captions, mock UI, or unrelated elements inside production atlases
- [ ] Check every asset against the visual guide and approved character canon
- [ ] Asset manifest marks each asset as planned, generated, reviewed, approved, or integrated

## Gate: do not start engine integration until
1. Every required asset category has a complete inventory.
2. Every production asset is exported separately in its intended dimensions and format.
3. Character designs are checked against the approved NPC list and story.
4. The asset manifest has no unresolved required items.
5. User approves the asset library.

After this gate, proceed to Godot engine integration, then implement the game flow, quests, NPC schedules, relationships, combat, save/load, and story progression.

## Current status
- A concept showcase has been generated to establish visual direction.
- Existing Godot procedural placeholders are prototypes only.
- No production asset category is complete yet.
