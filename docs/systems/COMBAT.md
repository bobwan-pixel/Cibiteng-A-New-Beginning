# Combat Design

This document records the current combat direction. Values are starting design targets and may be tuned after playtesting.

## Encounter types

### Small encounters
- Real-time RPG-style arena combat.
- Use a constrained encounter space, initially around 32x32 or 16x16 tiles where appropriate.
- Prioritize readable movement, attack range, and enemy tells.

### Major fights
- 2D/2.5D brawler presentation.
- Not full 3D.
- Bobwan's fighting style is boxing-oriented.
- Use stronger staging and character portraits to distinguish major confrontations.

## Player resources

| Resource | Purpose | Current rule |
|---|---|---|
| HP | Physical condition | Maximum target: 200 |
| Stamina | Physical exertion and post-fight fatigue | Small fight cost: roughly 10–30%; major fight: roughly 50% |
| Energy | Limits special actions | Regenerates during combat |

Before gym training, the intended minimum HP target is 100. The final progression curve remains to be balanced.

## Energy regeneration

Current target:
- Energy regeneration continues during combat, even while the player is being attacked.
- Baseline recovery cycle: 20 seconds.
- After Pirdaus gym training, the intended progression is 0% at the start, 50% after 15 seconds, and 100% after 30 seconds.

This timing needs a precise implementation definition (continuous vs. staged recovery) during the prototype.

## Actions

- Dash consumes energy and has a cooldown.
- Ultimate/special attack consumes energy and has a cooldown.
- Block has no cooldown, but consumes energy and reduces incoming HP damage.

## Implementation order

1. Player and enemy health.
2. Basic movement and hit detection.
3. Basic attack.
4. Damage and knockback feedback.
5. Stamina cost after an encounter.
6. Energy consumption and regeneration.
7. Dash and block.
8. Special attack.
9. Enemy behavior and balance.

## Testing requirements

- Verify resources never become negative.
- Verify energy regeneration does not pause when the player is hit.
- Verify block reduces damage and consumes energy.
- Verify stamina cost differs between encounter types.
- Test touch controls separately from keyboard controls.
