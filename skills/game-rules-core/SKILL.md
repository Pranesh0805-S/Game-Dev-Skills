---
name: game-rules-core
description: Universal game-design rules for any 2D or 3D game, any genre. Use when designing or implementing game mechanics, collision, physics, movement, game loop, state machines, win/lose conditions, or scoring, or when reviewing a game's rule structure for consistency.
---

# Game Rules Core

Genre-agnostic rules that every game needs. Genre quirks go on top of these, never replace them.

## Workflow
1. Identify dimension (2D/3D), genre, camera, and input scheme.
2. Define the rule set BEFORE code: entities, states, rules, win/lose, edge cases.
3. Implement using the patterns below.
4. Read `references/collision.md` for collision/physics specifics.
5. Output a `RULES.md` in the project listing every game-specific rule so it can be tested later.

## Universal structure
- **Game loop**: input -> update(fixed dt) -> collision -> state resolve -> render. Use a fixed timestep for physics, variable for rendering.
- **Game states**: `Boot -> Menu -> Playing <-> Paused -> GameOver/Win -> Menu`. Every transition must be explicit; no silent state changes.
- **Entities**: each has position, size/collider, velocity, state, and owner of its own rules.
- **Rules table**: for every rule write `Trigger -> Condition -> Effect -> Edge case`.

## Rules every game must define
- Win condition, lose condition, and what happens on restart (what resets, what persists).
- Score/progress: how it increases, caps, and is saved.
- Player health/lives: damage source, invulnerability window, death handling.
- Spawn/despawn: where, when, limits, and cleanup (no leaks).
- Difficulty curve: what scales and how fast.
- Input: simultaneous inputs, buffering, rebinding, pause behavior.

## Genre add-ons (pick what applies)
- **Platformer**: gravity, jump height/variable jump, coyote time (~100ms), jump buffer (~100ms), one-way platforms, moving-platform carry, fall-death plane.
- **Runner/endless**: speed ramp, procedural spawn spacing guaranteed passable, seed for reproducibility.
- **Shooter**: fire rate, projectile lifetime, hit registration, ammo/reload.
- **Puzzle**: deterministic state, undo, solvability check.
- **Racing/3D**: checkpoints, lap validation, anti-shortcut rules, camera collision.

## Hard rules
- Never tie gameplay logic to frame rate.
- Never let an entity leave the playable bounds without a defined outcome.
- Every rule gets a number (no "fast", use units/sec).
- Randomness must be seedable.
