# Game Design Document
## Cibiteng: A New Beginning

**Studio:** KOVEL STUDIO  
**Genre:** 2D life-simulation RPG / story adventure  
**Platforms:** PC and Android  
**Engine:** Godot 4  
**Visual direction:** Pixel-art world with illustrated character dialogue portraits  
**Project status:** Pre-production

## 1. High concept

The player follows Bobwan, a 24-year-old man trying to build a quieter and more stable life in the Cibiteng area. Everyday routines, friendships, romance, local problems, and physical conflicts gradually connect into a larger story.

The game balances four pillars:
1. Daily life and exploration.
2. Character relationships and romance.
3. Story quests and investigation.
4. Real-time combat and major confrontations.

## 2. Design pillars

- **People first:** NPCs have their own schedules, motivations, and story progression.
- **Grounded drama:** Conflicts come from human decisions and consequences, not supernatural events.
- **Player agency:** Important relationships and quest outcomes should develop through player actions.
- **Readable combat:** Controls and resource costs must be understandable on both keyboard and touch screens.
- **Small production scope:** Build a playable vertical slice before expanding the world.

## 3. Setting and tone

Cibiteng is a fictionalized area inspired by the Bekasi region. It combines village, kampung, and urban spaces. Real-world references may inspire architecture and atmosphere, but names, maps, and story details must remain original.

The era is described as **2014++**. The tone is generally calm and familiar, with tension emerging from relationships, crime, and personal loss.

## 4. Player character

Bobwan is 24 years old. He is helpful, humble, and capable in a fight. His central motivation is to build a quiet life. His family is supportive and harmonious.

Character details should be revealed through gameplay and dialogue rather than a long introductory biography.

## 5. Core gameplay loop

1. Explore an area and discover available activities.
2. Talk to NPCs and learn their current needs or schedules.
3. Complete daily tasks, quests, or investigations.
4. Improve relationships, skills, and access to locations.
5. Resolve conflicts through dialogue, evidence, or combat.
6. Return to daily life with changed schedules, relationships, and story flags.

## 6. World and progression

The world is planned to contain village, kampung, and city spaces. Locations should be introduced gradually. The initial playable slice should use one compact area rather than the entire planned map.

NPC schedules should be simple and deterministic at first. Add complexity only after the schedule system is stable.

## 7. Relationship system

- NPC relationships begin at the point where the player meets them.
- Romance progression must be earned through interactions and story events.
- Romance characters are planned to be 19–23 years old, while Bobwan is 24.
- Do not assume a romance relationship exists before the relevant story has happened.
- NPCs should retain their own goals and routines instead of existing only for the player.

## 8. Combat overview

Combat has two formats:
- **Small encounters:** real-time RPG-style arena combat.
- **Major fights:** 2D/2.5D brawler presentation, not full 3D.

The player uses HP, stamina, and energy as separate resources. See [Combat Design](systems/COMBAT.md) for the current rules.

## 9. Art and audio direction

- World and gameplay environments use pixel art.
- Character dialogue scenes use separate illustrated portraits rather than pixel sprites.
- Character portraits should communicate personality, outfit, and scene context.
- Use original assets or assets with clear redistribution rights.
- Audio is planned but not a blocker for the first prototype.

## 10. Technical constraints

The project must remain practical for:
- Acer Aspire ES1-131 class hardware, Celeron N3050, 4 GB RAM.
- Android 12-class phones, including devices with limited storage.

Technical choices:
- Godot 4 2D.
- Compatibility renderer.
- Small textures and atlases.
- Avoid expensive shaders, unnecessary 3D, and heavy editor plugins.
- Use separate, reusable scenes and scripts.
- Test Android touch controls early, not at the end.

## 11. First playable milestone

The first milestone is deliberately narrow:
- One small outdoor map.
- Bobwan can move in four directions.
- Camera follows the player.
- One NPC can be approached and spoken to.
- A simple interaction prompt.
- One small test encounter only after movement and interaction are stable.

No full romance, full investigation, or large map is required for this milestone.

## 12. Open design questions

These should be decided before the related systems are implemented:
- Final target Godot 4 minor version.
- Exact tile size and world grid.
- Final input layout for keyboard and touch.
- Save format and save-slot design.
- Day length and time progression.
- Full economy and inventory rules.
