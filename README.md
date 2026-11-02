# Cibiteng: A New Beginning

**KOVEL STUDIO** · Original 2D life-simulation RPG

Cibiteng is a grounded, story-driven 2D life-sim RPG about building relationships, exploring a fictionalized Bekasi-inspired area, handling everyday responsibilities, and surviving conflicts that grow out of the characters' lives.

## Project principles

- Original characters, locations, dialogue, art, and story.
- Romance, fighting, exploration, and daily life receive meaningful attention.
- No supernatural elements. The setting follows a realistic world and an era inspired by 2014 onward.
- PC and Android are the target platforms.
- Godot 4, 2D rendering, pixel-art environments.
- Free tools and a lightweight workflow suitable for low-spec hardware.
- Build in small, testable milestones. No giant unfinished systems.

## Current status

<badge>Pre-production</badge>

The repository now includes a lightweight playable prototype: a camera-following player, a procedural village block, a nearby NPC interaction, and on-screen controls. The map and character are still placeholder art, not final production assets. The prototype has not yet been run in the Godot editor, so target-device testing remains open.

## Documentation

- [Game Design Document](docs/GDD.md)
- [Story foundation](docs/STORY.md)
- [Development roadmap](docs/ROADMAP.md)
- [Combat design](docs/systems/COMBAT.md)
- [NPC design index](docs/characters/NPC_INDEX.md)

## Development setup

1. Install a stable Godot 4.x release that supports your operating system.
2. Clone this repository.
3. Open the repository folder in Godot using **Import** and select `project.godot`.
4. Keep early tests small: one scene, a few sprites, and simple scripts at a time.

The project uses the Compatibility renderer to reduce GPU demands. Actual performance still needs to be tested on the target laptop and Android device.

## Repository layout

```text
assets/       Art, audio, fonts, and other game resources
docs/         Design documents and production notes
scenes/       Godot scenes
scripts/      GDScript source
tests/        Lightweight test notes and test scenes
project.godot Godot project configuration
```

## Credits and ownership

Created for KOVEL STUDIO. All original project content should be authored for this game or used with a license that permits the intended distribution.
