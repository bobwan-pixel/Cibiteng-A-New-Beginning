# NPC Visual Identity Guide

## Goal

Every NPC must be recognizable by silhouette before the player reads their name. Hair shape, hair color, face details, outfit palette, accessories, and body language are separate design choices. Changing only the hair color is not enough.

## Current prototype cast

| NPC | Hair silhouette | Hair color | Face/accessory | Outfit palette |
|---|---|---|---|---|
| Pak RT | Short and neat | Near-black | Glasses | Muted blue |
| Mira | Long hair falling beside the face | Dark brown | No glasses | Rose |
| Deni | Tall spiky hair | Black | No glasses | Mustard |
| Bu Rina | Rounded bob cut | Dark brown | Glasses | Sage green |
| Fajar | Tight curls | Warm brown | No glasses | Blue-violet |

These five are temporary village prototype NPCs, not replacements for the approved main cast or romance characters.

## Character design rules

1. Give each character one dominant silhouette trait: long hair, bob, spiky hair, curls, undercut, ponytail, hijab, or another deliberate shape.
2. Do not reuse the same hair silhouette and merely recolor it.
3. Keep hair color distinct from hair style. Two characters may both have black hair but must not automatically share the same cut.
4. Use accessories sparingly but consistently: glasses, hair clips, hats, bags, watches, or other recognizable items.
5. Outfit colors should support personality and role, while remaining readable against the environment.
6. Main cast designs must follow their approved character descriptions. Do not invent new romance relationships or alter ages in the asset pipeline.

## Production asset checklist

- Front, back, left, and right walk cycles.
- Idle pose for all four directions.
- Consistent sprite cell size and pivot.
- Hair and accessories remain attached across animation frames.
- Palette contrast tested against grass, road, and indoor floors.
- Portrait art is a separate asset from the top-down gameplay sprite.
- Portraits must not all share the same face, hairstyle, outfit, or pose template.

## Current implementation status

The current five NPCs are procedural pixel placeholders drawn in `scripts/main.gd`. They now have different hair silhouettes, colors, optional glasses, outfit palettes, and name tags. They are not final production sprites or animated character assets.
